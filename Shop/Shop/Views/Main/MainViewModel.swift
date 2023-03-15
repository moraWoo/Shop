//
//  MainViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToLoginView() {
        print("MainViewModel goToLoginView()")
        guard let loginCoordinator = coordinator.parentCoordinator?.childCoordinators.first(where: { $0 is LoginCoordinator }) as? LoginCoordinator else {
            return
        }
        loginCoordinator.start()
    }
    
    func logout() {
        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else { return }
        parentCoordinator.removeChildCoordinator(coordinator)
        
        DispatchQueue.main.async {
            if let loginView = parentCoordinator.childCoordinators
                .first(where: { $0 is LoginCoordinator })?
                .start() {
                parentCoordinator.currentView = loginView
            }
        }
    }
    
    func goToMainView() {
        coordinator.goToMainView()
        print("After goToMainView()")
        coordinator.parentCoordinator?.addChildCoordinator(coordinator)
    }
}

