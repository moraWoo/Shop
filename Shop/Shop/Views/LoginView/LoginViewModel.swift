//
//  LoginViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var password = ""
    
    @Published var canSubmit = false
    
    @Published private var isValidFirstName = false
    @Published private var isValidPassword = false
    
    @Published var showErrorAlert = false

    var coordinator: Coordinator
    var mainCoordinator: MainCoordinator
    
    var firstNamePrompt: String? {
        if isValidFirstName == true || firstName.isEmpty {
            return nil
        } else {
            return "Enter correct first name"
        }
    }
    
    private var cancellableSet: Set<AnyCancellable> = []

    private let namePredicate = NSPredicate(format: "SELF MATCHES %@", Regex.name.rawValue)
    private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.password.rawValue)

    private let userRepository: UserRepository
    
    init(
        coordinator: Coordinator,
        mainCoordinator: MainCoordinator,
        userRepository: UserRepository
    ) {
        self.coordinator = coordinator
        self.mainCoordinator = mainCoordinator
        self.userRepository = userRepository
        
        $firstName
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { name in
                return self.namePredicate.evaluate(with: name)
            }
            .sink { [weak self] isValid in
                self?.isValidFirstName = isValid
            }
            .store(in: &cancellableSet)
        
        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { password in
                return self.passwordPredicate.evaluate(with: password)
            }
            .sink { [weak self] isValid in
                self?.isValidPassword = isValid
            }
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($isValidFirstName, $isValidPassword)
            .map { isValidFirstName, isValidPassword in
                return isValidFirstName && isValidPassword
            }
            .sink { [weak self] canSubmit in
                self?.canSubmit = canSubmit
            }
            .store(in: &cancellableSet)
    }
    
    func successfulLogin() {
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

    func login() {
        userRepository.checkUser(firstName: firstName, password: password)
            .sink { user in
                if let user = user {
                    print("User logged in successfully")
                    self.successfulLogin()
                } else {
                    print("Invalid credentials")
                    self.showErrorAlert = true
                }
            }
            .store(in: &cancellableSet)
    }
}


