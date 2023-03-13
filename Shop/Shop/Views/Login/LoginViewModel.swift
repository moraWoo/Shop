//
//  LoginViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let coordinator: LoginViewCoordinator
    
    init(coordinator: LoginViewCoordinator) {
        self.coordinator = coordinator
    }
    
    func signUpTapped() {
        coordinator.showSignUpView()
    }
    
    func signInTapped() {
//        coordinator.showMainView()
    }
}
