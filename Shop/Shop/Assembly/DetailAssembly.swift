import SwiftUI

class DetailAssembly {
    let dependencies: AppDependencies

    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }

    func assemble(appCoordinator: AppCoordinator) -> AnyView {
        let detailCoordinator = DetailCoordinator()
        detailCoordinator.parentCoordinator = appCoordinator
        
        let viewModel = DetailViewModel(
            coordinator: detailCoordinator,
            networkManager: dependencies.networkManager,
            navigationManager: dependencies.navigationManager
        )

        let view = DetailView(viewModel: viewModel)
            .environmentObject(appCoordinator)
        return AnyView(view)
    }
}
