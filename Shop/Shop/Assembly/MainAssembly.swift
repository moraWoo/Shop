import SwiftUI

class MainAssembly {
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        print("MainAssembly assemble()")
        let viewModel = MainViewModel(
            coordinator: dependencies.mainCoordinator,
            personInfoCoordinator: dependencies.personInfoCoordinator,
            userRepository: dependencies.userRepository
        )
        let view = MainView(viewModel: viewModel)
        dependencies.mainCoordinator.view = AnyView(view)

        return AnyView(view)
    }
}
