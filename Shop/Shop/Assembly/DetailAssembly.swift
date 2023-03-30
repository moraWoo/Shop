import SwiftUI

class DetailAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble() -> some View {
        
        guard let detailCoordinator = dependencies.detailCoordinator,
              let navigationManager = dependencies.navigationManager,
              let networkManager = dependencies.networkManager else {
            fatalError("DetailCoordinator or NavigationManager is missing")
        }
        
        let viewModel = DetailViewModel(
            coordinator: detailCoordinator,
            networkManager: networkManager,
            navigationManager: navigationManager
        )
        let view = DetailView(viewModel: viewModel, navigationManager: navigationManager)
        detailCoordinator.view = AnyView(view)

        return AnyView(view)
    }
}
