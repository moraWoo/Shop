import SwiftUI

class MainAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        
        if let mainCoordinator = dependencies.mainCoordinator,
           let personInfoCoordinator = dependencies.personInfoCoordinator,
           let detailCoordinator = dependencies.detailCoordinator,
           let loginCoordinator = dependencies.loginCoordinator,
           let navigationManager = dependencies.navigationManager {
            let viewModel = MainViewModel(
                coordinator: mainCoordinator,
                personInfoCoordinator: personInfoCoordinator,
                detailCoordinator: detailCoordinator,
                loginCoordinator: loginCoordinator,
                userRepository: dependencies.userRepository,
                networkManager: dependencies.networkManager,
                navigationManager: navigationManager
            )
            let view = MainView(viewModel: viewModel)
            mainCoordinator.view = AnyView(view)

            return AnyView(view)
        } else {
            fatalError("MainCoordinator or PersonInfoCoordinator is missing")
        }
    }
}
