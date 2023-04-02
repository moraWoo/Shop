import SwiftUI

class DetailAssembly {
    
    let dependencies: AppDependencies
    let detailCoordinator: DetailCoordinator

    init(dependencies: AppDependencies, detailCoordinator: DetailCoordinator) {
        self.dependencies = dependencies
        self.detailCoordinator = detailCoordinator
    }
    
    func assemble() -> some View {
        guard let appCoordinator = detailCoordinator.parentCoordinator as? AppCoordinator else {
            print("Error: detailCoordinator.parentCoordinator is not an instance of the AppCoordinator class.")
            return AnyView(EmptyView())
        }
        let viewModel = DetailViewModel(appCoordinator: appCoordinator, detailCoordinator: detailCoordinator)
        
        let view = DetailView(viewModel: viewModel)
        return AnyView(view)
    }
}
