import SwiftUI

class PersonInfoAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        
        guard let personInfoCoordinator = dependencies.personInfoCoordinator,
              let loginCoordinator = dependencies.loginCoordinator,
              let navigationManager = dependencies.navigationManager,
              let userRepository = dependencies.userRepository else {
            fatalError("PersonInfoCoordinator or LoginCoordinator is missing")
        }
        
        let viewModel = PersonInfoViewModel(
            coordinator: personInfoCoordinator,
            loginCoordinator: loginCoordinator,
            userRepository: userRepository,
            navigationManager: navigationManager
        )
        let view = PersonInfoView(viewModel: viewModel, navigationManager: navigationManager)
        personInfoCoordinator.view = AnyView(view)

        return AnyView(view)
    }
}
