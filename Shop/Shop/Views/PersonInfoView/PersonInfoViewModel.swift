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
        if let currentUser = appCoordinator.dependencies.userRepository.currentUser {
            appCoordinator.dependencies.userRepository.setIsLogged(
                user: currentUser,
                isLogged: false
            )
            appCoordinator.dependencies.userRepository.saveContext()
        }
        personInfoCoordinator.parentCoordinator?.removeChildCoordinator(
            personInfoCoordinator
        )
        appCoordinator.showLogin()
    }
    
    func updateAvatar(image: UIImage) {
        
        if let user = appCoordinator.dependencies.userRepository.currentUser {
            appCoordinator.dependencies.userRepository.updateAvatar(
                user: user,
                avatar: image
            )
            profileImage = image
        }
    }
}
