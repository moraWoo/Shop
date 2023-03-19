//
//  LoginViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var canSubmit = false
    
    @Published private var isValidPhone = false
    @Published private var isValidEmail = false
    @Published private var isValidPassword = false
    
    var coordinator: Coordinator
    var mainCoordinator: MainCoordinator
    
    var passwordPrompt: String? {
        if isValidPassword == true || password.isEmpty {
            return nil
        } else {
            return "Password - requerid field"
        }
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(coordinator: Coordinator, mainCoordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.mainCoordinator = mainCoordinator
        
        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isValidPassword, on: self)
            .store(in: &cancellableSet)
        
        $isValidPassword
            .sink { isValid in
                self.canSubmit = isValid
            }
            .store(in: &cancellableSet)
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


