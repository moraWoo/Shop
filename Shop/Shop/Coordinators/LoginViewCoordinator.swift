//
//  LoginViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class LoginViewCoordinator: Coordinator {
    func start() -> AnyView {
        let viewModel = LoginViewModel()
        let view = LoginView(viewModel: viewModel)
        return AnyView(view)
    }
    
    func showSignUpView() {
        let signUpCoordinator = SignUpViewCoordinator()
        addChildCoordinator(signUpCoordinator)
        currentView = signUpCoordinator.start()
    }
    
    private func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    private func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
