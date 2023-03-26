import SwiftUI
import Combine

class PersonInfoViewModel: ObservableObject {
    
    @Published var profileImage: UIImage?
    
    var coordinator: PersonInfoCoordinator
    var loginCoordinator: LoginCoordinator
    let userRepository: UserRepository
    let networkManager: NetworkManager
    let navigationManager: NavigationManager

    private var cancellableSet: Set<AnyCancellable> = []

    var firstName: String? {
        userRepository.currentUser?.firstName
    }
    
    init(
        coordinator: PersonInfoCoordinator,
        loginCoordinator: LoginCoordinator,
        userRepository: UserRepository,
        networkManager: NetworkManager,
        navigationManager: NavigationManager
    ) {
        self.coordinator = coordinator
        self.loginCoordinator = loginCoordinator
        self.userRepository = userRepository
        self.networkManager = networkManager
        self.navigationManager = navigationManager
        
        if let currentUser = userRepository.currentUser,
           let avatarData = currentUser.avatar {
            profileImage = UIImage(data: avatarData)
        }
    }
    
    func logout() {
        if let currentUser = userRepository.currentUser {
            userRepository.setIsLogged(user: currentUser, isLogged: false)
            userRepository.saveContext()
        }
        
        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else { return }
        parentCoordinator.removeChildCoordinator(coordinator)
        
        if let loginCoordinator = parentCoordinator.childCoordinators.first(where: { $0 is LoginCoordinator }) {
            parentCoordinator.removeChildCoordinator(loginCoordinator)
        }
        
        loginCoordinator.parentCoordinator = parentCoordinator
        parentCoordinator.addChildCoordinator(loginCoordinator)
        
        DispatchQueue.main.async {
            let loginView = self.loginCoordinator.start()
            parentCoordinator.currentView = loginView
        }
    }
    
    func updateAvatar(image: UIImage) {
        if let user = userRepository.currentUser {
            userRepository.updateAvatar(user: user, avatar: image)
            profileImage = image
        }
    }
    
    func goBackToMainView() {
        coordinator.navigationManager.navigateBack()
    }

}
