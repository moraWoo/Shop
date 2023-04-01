import SwiftUI
import Combine

class PersonInfoViewModel: ObservableObject {
    
    @Published var profileImage: UIImage?
    private var cancellableSet: Set<AnyCancellable> = []

    var firstName: String? {
        appCoordinator.dependencies.userRepository.currentUser?.firstName
    }
    
    let appCoordinator: AppCoordinator
    private let personInfoCoordinator: PersonInfoCoordinator
    
    init(
        appCoordinator: AppCoordinator,
        personInfoCoordinator: PersonInfoCoordinator
    ) {
        self.appCoordinator = appCoordinator
        self.personInfoCoordinator = personInfoCoordinator

        if let currentUser = appCoordinator.dependencies.userRepository.currentUser,
           let avatarData = currentUser.avatar {
            profileImage = UIImage(data: avatarData)
        }
    }
    
    func logout() {
//        if let currentUser = userRepository.currentUser {
//            userRepository.setIsLogged(user: currentUser, isLogged: false)
//            userRepository.saveContext()
//        }
//
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
//            let loginView = self.loginCoordinator.start()
//            parentCoordinator.currentView = loginView
//        }
    }
    
    func updateAvatar(image: UIImage) {
        
        if let user = appCoordinator.dependencies.userRepository.currentUser {
            appCoordinator.dependencies.userRepository.updateAvatar(user: user, avatar: image)
            profileImage = image
        }
    }
}
