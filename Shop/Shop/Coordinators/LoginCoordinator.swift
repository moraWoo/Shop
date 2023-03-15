//
//  LoginViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var view: AnyView?
    
    func start() -> AnyView {
        let dependencies = AppDependencies(loginCoordinator: self, mainCoordinator: MainCoordinator())
        let loginView = LoginAssembly(dependencies: dependencies).assemble()
        view = AnyView(loginView)
        print("View from LoginCoordinator \(view)")
        if let view = view {
            return view
        } else {
            return AnyView(EmptyView())
        }
    }
    
    func login() {
        let mainCoordinator = MainCoordinator()
        addChildCoordinator(mainCoordinator)
        let viewModel = LoginViewModel(coordinator: self, mainCoordinator: mainCoordinator)
        let loginView = LoginView(viewModel: viewModel)
        let view = AnyView(loginView)
        self.view = view
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
            coordinator.parentCoordinator = nil
            view = nil
        }
    }
}



