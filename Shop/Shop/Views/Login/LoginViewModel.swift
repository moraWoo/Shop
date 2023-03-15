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
        goToMainView()
    }
    
    func goToMainView() {
        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else {
            print("Parent coordinator is nil")
            return
        }
        print("Parent coordinator type:", type(of: parentCoordinator))
        print("Child coordinators:", parentCoordinator.childCoordinators)

        parentCoordinator.removeChildCoordinator(mainCoordinator)
        mainCoordinator.parentCoordinator = parentCoordinator
        parentCoordinator.addChildCoordinator(mainCoordinator)

        let mainView = mainCoordinator.start()
        parentCoordinator.currentView = mainView
    }
}


