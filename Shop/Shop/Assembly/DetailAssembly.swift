import SwiftUI

class DetailAssembly {
    
    let dependencies: AppDependencies
    let detailCoordinator: DetailCoordinator

    init(dependencies: AppDependencies, detailCoordinator: DetailCoordinator) {
        self.dependencies = dependencies
        self.detailCoordinator = detailCoordinator
    }
    
    func assemble() -> some View {
        let viewModel = DetailViewModel(
            appCoordinator: detailCoordinator.parentCoordinator as! AppCoordinator,
            detailCoordinator: detailCoordinator
        )
        let view = DetailView(viewModel: viewModel)
        return AnyView(view)
    }
}
