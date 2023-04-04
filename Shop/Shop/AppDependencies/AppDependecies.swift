import Foundation

class AppDependencies {
  lazy var coreDataManager = CoreDataManager.shared
  lazy var userRepository = UserRepository(coreDataManager: coreDataManager)
  lazy var networkManager = NetworkManager()
  lazy var navigationManager = NavigationManager()

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
