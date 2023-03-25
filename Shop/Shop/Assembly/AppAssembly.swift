import SwiftUI

class AppAssembly {
    
    static func assemble() -> some View {
        
        let coreDataManager = CoreDataManager.shared
        let userRepository = UserRepository(coreDataManager: coreDataManager)
        let networkManager = NetworkManager()
        
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: LoginCoordinator(),
            mainCoordinator: MainCoordinator(),
            personInfoCoordinator: PersonInfoCoordinator(),
            detailCoordinator: DetailCoordinator(),
            userRepository: userRepository,
            networkManager: networkManager
        )
        
        let appCoordinator = AppCoordinator()
        
        let signUpAssembly = SignUpAssembly(dependencies: dependencies)
        let loginAssembly = LoginAssembly(dependencies: dependencies)
        let mainAssembly = MainAssembly(dependencies: dependencies)
        let personInfoAssembly = PersonInfoAssembly(dependencies: dependencies)
        let detailAssembly = DetailAssembly(dependencies: dependencies)

        if let signUpCoordinator = signUpAssembly.dependencies.signUpCoordinator {
            appCoordinator.addChildCoordinator(signUpCoordinator)
        }
        if let loginCoordinator = loginAssembly.dependencies.loginCoordinator {
            appCoordinator.addChildCoordinator(loginCoordinator)
        }
        if let mainCoordinator = mainAssembly.dependencies.mainCoordinator {
            appCoordinator.addChildCoordinator(mainCoordinator)
        }
        if let personInfoCoordinator = personInfoAssembly.dependencies.personInfoCoordinator {
            appCoordinator.addChildCoordinator(personInfoCoordinator)
        }
        if let detailCoordinator = detailAssembly.dependencies.detailCoordinator {
            appCoordinator.addChildCoordinator(detailCoordinator)
        }
        
        print("AppCoordinator child coordinators:", appCoordinator.childCoordinators)
        print("AppCoordinator child coordinators:", appCoordinator.childCoordinators)
        if let mainCoordinatorParentCoordinator = mainAssembly.dependencies.mainCoordinator?.parentCoordinator {
            print("MainCoordinator parent coordinator:", mainCoordinatorParentCoordinator)
        } else {
            print("MainCoordinator parent coordinator is nil")
        }
        return AnyView(signUpAssembly.assemble(userRepository: userRepository))
    }
}
