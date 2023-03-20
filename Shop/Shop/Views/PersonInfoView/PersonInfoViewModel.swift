//
//  ProfileViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class PersonInfoViewModel: ObservableObject {
    var coordinator: PersonInfoCoordinator
    var loginCoordinator: LoginCoordinator
    private let userRepository: UserRepository
    
    init(
        coordinator: PersonInfoCoordinator,
        loginCoordinator: LoginCoordinator,
        userRepository: UserRepository
    ) {
        self.coordinator = coordinator
        self.loginCoordinator = loginCoordinator
        self.userRepository = userRepository
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
}
