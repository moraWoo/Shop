import SwiftUI

class DetailAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble() -> some View {
        let viewModel = DetailViewModel(coordinator: dependencies.detailCoordinator)
        let view = DetailView(viewModel: viewModel)
        dependencies.detailCoordinator.view = AnyView(view)
        
        return AnyView(view)
    }
}
