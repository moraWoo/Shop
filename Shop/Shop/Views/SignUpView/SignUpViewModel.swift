import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    
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
    private let userRepository: UserRepository
    
    var coordinator: SignUpCoordinator
    var loginCoordinator: LoginCoordinator
    var mainCoordinator: MainCoordinator
    
    init(
        coordinator: SignUpCoordinator,
        loginCoordinator: LoginCoordinator,
        mainCoordinator: MainCoordinator,
        userRepository: UserRepository
    ) {
        self.userRepository = userRepository
        self.coordinator = coordinator
        self.loginCoordinator = loginCoordinator
        self.mainCoordinator = mainCoordinator
        
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
    
    func login() {
        goToLoginView()
    }
    
    func goToLoginView() {
        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else {
            print("Parent coordinator is nil")
            return
        }
        
        parentCoordinator.removeChildCoordinator(loginCoordinator)
        loginCoordinator.parentCoordinator = parentCoordinator
        parentCoordinator.addChildCoordinator(loginCoordinator)
        
        let loginView = loginCoordinator.start()
        parentCoordinator.currentView = loginView
    }
    
    func goToMainView() {
        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else {
            print("Parent coordinator is nil")
            return
        }
        
        parentCoordinator.removeChildCoordinator(mainCoordinator)
        mainCoordinator.parentCoordinator = parentCoordinator
        parentCoordinator.addChildCoordinator(mainCoordinator)
        
        let mainView = mainCoordinator.start()
        parentCoordinator.currentView = mainView
    }
    
    func checkExistingUser() -> AnyPublisher<Bool, Never> {
        userRepository.checkUser(firstName: firstName, lastName: lastName, email: email)
            .map { $0 != nil }
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .handleEvents(receiveOutput: { [weak self] userExists in
                if let self = self {
                    self.showPasswordInput = !userExists
                }
            })
            .eraseToAnyPublisher()
    }

    func createUser() {
        userRepository.createUser(firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.password)
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
        userRepository.checkUser(firstName: firstName, lastName: lastName, email: email)
            .sink { existingUser in
                if let _ = existingUser {
                    self.userExists = true
                } else {
                    self.checkExistingUser()
                }
            }
            .store(in: &cancellableSet)
    }

}
