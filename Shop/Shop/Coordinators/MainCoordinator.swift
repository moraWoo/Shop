//
//  MainViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class MainCoordinator: Coordinator {
    var view: AnyView?
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    func start() -> AnyView {
        let dependencies = AppDependencies(loginCoordinator: LoginCoordinator(), mainCoordinator: self)
        let mainView = MainAssembly(dependencies: dependencies).assemble()
        view = AnyView(mainView)
        return view!
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
            view = nil
        }
    }
    
    func goToMainView() {
        // Implement code to transition to main view
    }
}