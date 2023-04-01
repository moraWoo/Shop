import SwiftUI

class MainAssembly {
    let dependencies: AppDependencies

    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }

    func assemble(appCoordinator: AppCoordinator) -> AnyView {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.parentCoordinator = appCoordinator
        
        let viewModel = MainViewModel(
            coordinator: mainCoordinator,
            userRepository: dependencies.userRepository,
            networkManager: dependencies.networkManager,
            navigationManager: dependencies.navigationManager
        )

        let view = MainView(viewModel: viewModel)
            .environmentObject(appCoordinator)
        return AnyView(view)
    }
}
