import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var password = ""
    
    @Published var canSubmit = false
    
    @Published private var isValidFirstName = false
    @Published private var isValidPassword = false
    
    @Published var showErrorAlert = false
        
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
    
    private let appCoordinator: AppCoordinator
    private let loginCoordinator: LoginCoordinator

    init(
        appCoordinator: AppCoordinator,
        loginCoordinator: LoginCoordinator
    ) {
        self.appCoordinator = appCoordinator
        self.loginCoordinator = loginCoordinator
        
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
        loginCoordinator.parentCoordinator?.removeChildCoordinator(loginCoordinator)
        appCoordinator.showMain()
    }
    
    func login() {
        if firstName.isEmpty || password.isEmpty {
            print("Fields cannot be empty")
            self.showErrorAlert = true
            return
        }
        
        appCoordinator.dependencies.userRepository.checkUser(firstName: firstName, password: password)
            .sink { user in
                if let user = user {
                    self.appCoordinator.dependencies.userRepository.setIsLogged(user: user, isLogged: true)
                    self.successfulLogin()
                } else {
                    print("Invalid credentials")
                    self.showErrorAlert = true
                }
            }
            .store(in: &cancellableSet)
    }
}


