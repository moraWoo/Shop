import SwiftUI

class PersonInfoAssembly {
    let dependencies: AppDependencies

    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }

    func assemble(appCoordinator: AppCoordinator) -> AnyView {
        let personInfoCoordinator = PersonInfoCoordinator()
        personInfoCoordinator.parentCoordinator = appCoordinator
        
        let viewModel = PersonInfoViewModel(
            coordinator: personInfoCoordinator,
            userRepository: dependencies.userRepository,
            navigationManager: dependencies.navigationManager
        )

        let view = PersonInfoView(viewModel: viewModel)
            .environmentObject(appCoordinator)
        return AnyView(view)
    }
}
