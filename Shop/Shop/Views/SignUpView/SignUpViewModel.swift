import Foundation
import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    @EnvironmentObject var appCoordinator: AppCoordinator

    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var canSubmit = false
    
    @Published private var isValidFirstName = false
    @Published private var isValidLastName = false
    @Published private var isValidEmail = false

    @Published var showErrorAlert = false

    @Published var showPasswordInput = false
    @Published var userExists = false
    
    var cancellableSet: Set<AnyCancellable> = []

    var firstNamePrompt: String? {
        if isValidFirstName == true || firstName.isEmpty {
            return nil
        } else {
            return "Enter correct first name"
        }
    }
    
    var lastNamePrompt: String? {
        if isValidLastName == true || lastName.isEmpty {
            return nil
        } else {
            return "Enter correct last name"
        }
    }
    
    var emailPrompt: String? {
        if userExists {
            return "User with this email already exists"
        } else if isValidEmail == true || email.isEmpty {
            return nil
        } else {
            return "Enter valid Email. Example: test@test.com"
        }
    }
    
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
    private let namePredicate = NSPredicate(format: "SELF MATCHES %@", Regex.name.rawValue)
    
    let coordinator: SignUpCoordinator
    let userRepository: UserRepository
    
    init(
        coordinator: SignUpCoordinator,
        userRepository: UserRepository
    ) {
        self.coordinator = coordinator
        self.userRepository = userRepository
        
        $firstName
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { name in
                return self.namePredicate.evaluate(with: name)
            }
            .assign(to: \.isValidFirstName, on: self)
            .store(in: &cancellableSet)
        
        $lastName
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { name in
                return self.namePredicate.evaluate(with: name)
            }
            .assign(to: \.isValidLastName, on: self)
            .store(in: &cancellableSet)
        
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest3($isValidFirstName, $isValidLastName, $isValidEmail)
            .map { first, second, third in
                return (first && second && third)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
        
    }

    
    func checkExistingUser() -> AnyPublisher<Bool, Never> {
        userRepository.checkUser(firstName: firstName, lastName: lastName, email: email)
            .map { $0 != nil }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func createUser() {
        userRepository.createUser(
            firstName: self.firstName,
            lastName: self.lastName,
            email: self.email,
            password: self.password
        )
            .sink { success in
                if success {
                    self.setUserStatus()
                } else {
                    print("Error creating user")
                }
            }
            .store(in: &self.cancellableSet)
    }

    func setUserStatus() {
        userRepository.checkUser(firstName: self.firstName)
            .sink { user in
                if let user = user {
                    self.userRepository.setIsLogged(user: user, isLogged: true)
                    self.userRepository.saveContext()
                    self.goToMainView()
                } else {
                    print("Error retrieving created user")
                }
            }
            .store(in: &self.cancellableSet)
    }

    func signUp() {
        userRepository.checkUser(
            firstName: firstName,
            lastName: lastName,
            email: email
        )
            .sink { existingUser in
                if let _ = existingUser {
                    self.userExists = true
                } else {
                    self.checkExistingUser()
                }
            }
            .store(in: &cancellableSet)
    }
    
    func goToLoginView() {
        appCoordinator.navigateToLogin()
    }
    
    func goToMainView() {
        appCoordinator.navigateToMain()
    }
}
