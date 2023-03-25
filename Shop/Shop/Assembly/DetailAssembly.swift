import SwiftUI

class DetailAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble() -> some View {
        
        guard let detailCoordinator = dependencies.detailCoordinator else {
            fatalError("DetailCoordinator is missing")
        }
        
        let viewModel = DetailViewModel(
            coordinator: detailCoordinator,
            networkManager: dependencies.networkManager
        )
        let view = DetailView(viewModel: viewModel)
        detailCoordinator.view = AnyView(view)

        return AnyView(view)
    }
}
