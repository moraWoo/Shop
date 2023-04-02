import SwiftUI

class MainAssembly {
    
    let dependencies: AppDependencies
    let mainCoordinator: MainCoordinator

    init(dependencies: AppDependencies, mainCoordinator: MainCoordinator) {
        self.dependencies = dependencies
        self.mainCoordinator = mainCoordinator
    }
    
    func assemble() -> some View {
        let viewModel = MainViewModel(
            appCoordinator: mainCoordinator.parentCoordinator as! AppCoordinator,
            mainCoordinator: mainCoordinator
        )
        let view = MainView(viewModel: viewModel)
        return AnyView(view)
    }
}
