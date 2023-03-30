import Foundation

class AppDependencies {
    
    let signUpCoordinator: SignUpCoordinator?
    let loginCoordinator: LoginCoordinator?
    let mainCoordinator: MainCoordinator?
    let personInfoCoordinator: PersonInfoCoordinator?
    let detailCoordinator: DetailCoordinator?
    let userRepository: UserRepository?
    let networkManager: NetworkManager?
    let navigationManager: NavigationManager?
    
    init(
        signUpCoordinator: SignUpCoordinator? = nil,
        loginCoordinator: LoginCoordinator? = nil,
        mainCoordinator: MainCoordinator? = nil,
        personInfoCoordinator: PersonInfoCoordinator? = nil,
        detailCoordinator: DetailCoordinator? = nil,
        userRepository: UserRepository? = nil,
        networkManager: NetworkManager? = nil,
        navigationManager: NavigationManager? = nil
    ) {
        self.loginCoordinator = loginCoordinator
        self.signUpCoordinator = signUpCoordinator
        self.mainCoordinator = mainCoordinator
        self.personInfoCoordinator = personInfoCoordinator
        self.detailCoordinator = detailCoordinator
        self.userRepository = userRepository
        self.networkManager = networkManager
        self.navigationManager = navigationManager
    }
}
