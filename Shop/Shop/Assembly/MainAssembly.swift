import SwiftUI

class MainAssembly {
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        print("MainAssembly assemble()")
        if let mainCoordinator = dependencies.mainCoordinator,
           let personInfoCoordinator = dependencies.personInfoCoordinator {
            let viewModel = MainViewModel(
                coordinator: mainCoordinator,
                personInfoCoordinator: personInfoCoordinator,
                userRepository: dependencies.userRepository,
                networkManager: dependencies.networkManager
            )
            let view = MainView(viewModel: viewModel)
            mainCoordinator.view = AnyView(view)

            return AnyView(view)
        } else {
            fatalError("MainCoordinator or PersonInfoCoordinator is missing")
        }
    }
}
