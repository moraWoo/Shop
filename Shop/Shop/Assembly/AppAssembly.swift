import SwiftUI

class AppAssembly {
    
    static func assemble() -> some View {
        let coreDataManager = CoreDataManager.shared
        let userRepository = UserRepository(coreDataManager: coreDataManager)
        
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: LoginCoordinator(),
            mainCoordinator: MainCoordinator(),
            personInfoCoordinator: PersonInfoCoordinator(),
            detailCoordinator: DetailCoordinator(),
            userRepository: userRepository
        )
        
        let appCoordinator = AppCoordinator()
        
        let signUpAssembly = SignUpAssembly(dependencies: dependencies)
        let loginAssembly = LoginAssembly(dependencies: dependencies)
        let mainAssembly = MainAssembly(dependencies: dependencies)
        let personInfoAssembly = PersonInfoAssembly(dependencies: dependencies)
        let detailAssembly = DetailAssembly(dependencies: dependencies)

        appCoordinator.addChildCoordinator(signUpAssembly.dependencies.signUpCoordinator)
        appCoordinator.addChildCoordinator(loginAssembly.dependencies.loginCoordinator)
        appCoordinator.addChildCoordinator(mainAssembly.dependencies.mainCoordinator)
        appCoordinator.addChildCoordinator(personInfoAssembly.dependencies.personInfoCoordinator)
        appCoordinator.addChildCoordinator(detailAssembly.dependencies.detailCoordinator)

        
        print("AppCoordinator child coordinators:", appCoordinator.childCoordinators)
        print("AppCoordinator child coordinators:", appCoordinator.childCoordinators)
        if let mainCoordinatorParentCoordinator = mainAssembly.dependencies.mainCoordinator.parentCoordinator {
            print("MainCoordinator parent coordinator:", mainCoordinatorParentCoordinator)
        } else {
            print("MainCoordinator parent coordinator is nil")
        }
        return AnyView(signUpAssembly.assemble(userRepository: userRepository))
    }
}
