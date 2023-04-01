import Foundation

class AppDependencies {
    
    lazy var coreDataManager: CoreDataManager = CoreDataManager.shared
    lazy var userRepository: UserRepository = UserRepository(coreDataManager: coreDataManager)
    lazy var networkManager: NetworkManager = NetworkManager()
    lazy var navigationManager: NavigationManager = NavigationManager()
    
    init(
        coreDataManager: CoreDataManager = CoreDataManager.shared,
        userRepository: UserRepository? = nil,
        networkManager: NetworkManager = NetworkManager(),
        navigationManager: NavigationManager = NavigationManager()
    ) {
        self.coreDataManager = coreDataManager
        self.networkManager = networkManager
        self.navigationManager = navigationManager
        self.userRepository = userRepository ?? UserRepository(coreDataManager: coreDataManager)
    }
}
