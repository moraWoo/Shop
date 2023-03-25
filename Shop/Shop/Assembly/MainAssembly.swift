import SwiftUI

class MainAssembly {
    
    let dependencies: AppDependencies

    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        
        if let mainCoordinator = dependencies.mainCoordinator,
           let personInfoCoordinator = dependencies.personInfoCoordinator,
           let navigationManager = dependencies.navigationManager {
            let viewModel = MainViewModel(
                coordinator: mainCoordinator,
                personInfoCoordinator: personInfoCoordinator,
                userRepository: dependencies.userRepository,
                networkManager: dependencies.networkManager,
                navigationManager: navigationManager
            )
            
            let view = MainView(viewModel: viewModel)
            mainCoordinator.view = AnyView(view)

            return AnyView(view)
        } else {
            fatalError("MainCoordinator, PersonInfoCoordinator, or NavigationManager is missing")
        }
    }
}

