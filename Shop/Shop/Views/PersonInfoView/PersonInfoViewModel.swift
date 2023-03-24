import SwiftUI
import Combine

class PersonInfoViewModel: ObservableObject {
    @Published var profileImage: UIImage?
    @Published var userFirstName = ""
    
    var coordinator: PersonInfoCoordinator
    var loginCoordinator: LoginCoordinator
    private let userRepository: UserRepository
    private var cancellableSet: Set<AnyCancellable> = []

    init(
        coordinator: PersonInfoCoordinator,
        loginCoordinator: LoginCoordinator,
        userRepository: UserRepository
    ) {
        self.coordinator = coordinator
        self.loginCoordinator = loginCoordinator
        self.userRepository = userRepository
        
        // Set the user's first name when the currentUser is updated
        userRepository.$currentUser
            .compactMap { $0?.firstName }
            .assign(to: \.userFirstName, on: self)
            .store(in: &cancellableSet)
        
        // Load the user's avatar when the currentUser is updated
        userRepository.$currentUser
            .compactMap { $0?.firstName }
            .sink { [weak self] firstName in
                self?.loadAvatar(firstName: firstName)
            }
            .store(in: &cancellableSet)
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
    
    func saveAvatar(firstName: String, avatar: UIImage) {
        userRepository.saveUserAvatar(firstName: firstName, avatar: avatar)
            .sink { success in
                print("Avatar save result: \(success)")
            }
            .store(in: &cancellableSet)
    }

    func loadAvatar(firstName: String) {
        userRepository.loadUserAvatar(firstName: firstName)
            .sink { avatar in
                if let avatar = avatar {
                    // Обработка загруженного аватара
                }
            }
            .store(in: &cancellableSet)
    }
}
