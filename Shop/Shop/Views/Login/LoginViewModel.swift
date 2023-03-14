//
//  LoginViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func login() {
        // Perform login action and notify delegate on success
        goToMainView()
    }
    
    func goToMainView() {
        guard let mainCoordinator = coordinator.parentCoordinator as? MainCoordinator else {
            return
        }
        mainCoordinator.goToMainView()
    }
}

