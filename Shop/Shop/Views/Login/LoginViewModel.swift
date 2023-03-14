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
    var mainCoordinator: MainCoordinator
    
    init(coordinator: Coordinator, mainCoordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.mainCoordinator = mainCoordinator
    }
    
    func login() {
        // Perform login action and notify delegate on success
        goToMainView()
    }
    
    func goToMainView() {
        guard let parentCoordinator = coordinator.parentCoordinator as? MainCoordinator else {
            print("Failed to find MainCoordinator")
            return
        }
        
        parentCoordinator.removeChildCoordinator(parentCoordinator)
        mainCoordinator.parentCoordinator = parentCoordinator
        parentCoordinator.addChildCoordinator(mainCoordinator)
        
        mainCoordinator.goToMainView()
    }
}


