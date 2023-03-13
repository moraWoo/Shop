//
//  LoginViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class LoginViewCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var currentView: AnyView = AnyView(Text("Details view"))
    
    init() {}
    
    func start() -> AnyView {
        let viewModel = LoginViewModel()
        let view = LoginView(viewModel: viewModel)
        return AnyView(view)
    }
    
    func showSignInView() {
        let signInCoordinator = SignInCoordinator()
        addChildCoordinator(signInCoordinator)
        currentView = signInCoordinator.start()
    }
    
    private func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    private func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
