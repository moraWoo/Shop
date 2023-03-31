import SwiftUI
import Combine

class PersonInfoViewModel: ObservableObject {
    
    @Published var profileImage: UIImage?
    
    let coordinator: PersonInfoCoordinator
    let userRepository: UserRepository
    let navigationManager: NavigationManager
    
    private var cancellableSet: Set<AnyCancellable> = []

    var firstName: String? {
        userRepository.currentUser?.firstName
    }
    
    init(
        coordinator: PersonInfoCoordinator,
        userRepository: UserRepository,
        navigationManager: NavigationManager
    ) {
        self.coordinator = coordinator
        self.userRepository = userRepository
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
        
//        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else { return }
//        parentCoordinator.removeChildCoordinator(coordinator)
//        
//        if let loginCoordinator = parentCoordinator.childCoordinators.first(where: { $0 is LoginCoordinator }) {
//            parentCoordinator.removeChildCoordinator(loginCoordinator)
//        }
//        
//        loginCoordinator.parentCoordinator = parentCoordinator
//        parentCoordinator.addChildCoordinator(loginCoordinator)
//        
//        DispatchQueue.main.async {
//            self.loginCoordinator.start()
//                .sink(receiveValue: { loginView in
//                    parentCoordinator.currentView = loginView
//                })
//                .store(in: &self.cancellableSet)
//        }
    }
    
    func updateAvatar(image: UIImage) {
        
        if let user = userRepository.currentUser {
            userRepository.updateAvatar(user: user, avatar: image)
            profileImage = image
        }
    }
}
