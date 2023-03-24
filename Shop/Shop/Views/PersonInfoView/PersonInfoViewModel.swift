import SwiftUI
import Combine

class PersonInfoViewModel: ObservableObject {
    @Published var profileImage: UIImage?
    
    var coordinator: PersonInfoCoordinator
    var loginCoordinator: LoginCoordinator
    private let userRepository: UserRepository
    private var cancellableSet: Set<AnyCancellable> = []

    var firstName: String? {
        userRepository.firstName
    }
    
    init(
        coordinator: PersonInfoCoordinator,
        loginCoordinator: LoginCoordinator,
        userRepository: UserRepository
    ) {
        self.coordinator = coordinator
        self.loginCoordinator = loginCoordinator
        self.userRepository = userRepository
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
}
