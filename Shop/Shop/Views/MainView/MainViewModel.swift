//
//  MainViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    var coordinator: MainCoordinator
    var personInfoCoordinator: PersonInfoCoordinator
    private let userRepository: UserRepository

    init(
        coordinator: MainCoordinator,
        personInfoCoordinator: PersonInfoCoordinator,
        userRepository: UserRepository
    ) {
        self.coordinator = coordinator
        self.personInfoCoordinator = personInfoCoordinator
        self.userRepository = userRepository
    }
    
    func goToLoginView() {
        print("MainViewModel goToLoginView()")
        guard let loginCoordinator = coordinator.parentCoordinator?.childCoordinators.first(where: { $0 is LoginCoordinator }) as? LoginCoordinator else {
            return
        }
        loginCoordinator.start()
    }
    
    func goToMainView() {
        coordinator.goToMainView()
        print("After goToMainView()")
        coordinator.parentCoordinator?.addChildCoordinator(coordinator)
    }
    
    func personInfo() {
        goToPersonInfoView()
//        coordinator.goToPersonInfoView()
//        print("After goToPersonInfoView()")
//        coordinator.parentCoordinator?.addChildCoordinator(coordinator)
    }
    
    func goToPersonInfoView() {
        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else {
            print("Parent coordinator is nil")
            return
        }
        print("Parent coordinator type:", type(of: parentCoordinator))
        print("Child coordinators:", parentCoordinator.childCoordinators)
        
        parentCoordinator.removeChildCoordinator(personInfoCoordinator)
        personInfoCoordinator.parentCoordinator = parentCoordinator
        parentCoordinator.addChildCoordinator(personInfoCoordinator)
        
        let personInfoView = personInfoCoordinator.start()
        
        parentCoordinator.currentView = personInfoView
    }
}

