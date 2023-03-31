import Foundation

class AppDependencies {
    // Initializing of managers
    lazy var coreDataManager: CoreDataManager = CoreDataManager.shared
    lazy var userRepository: UserRepository = UserRepository()
    lazy var networkManager: NetworkManager = NetworkManager()
    lazy var navigationManager: NavigationManager = NavigationManager()
}
