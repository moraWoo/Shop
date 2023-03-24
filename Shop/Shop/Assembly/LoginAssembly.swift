import SwiftUI

class LoginAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        let viewModel = LoginViewModel(
            coordinator: dependencies.loginCoordinator,
            mainCoordinator: dependencies.mainCoordinator,
            userRepository: dependencies.userRepository
        )
        let view = LoginView(viewModel: viewModel)
        dependencies.loginCoordinator.view = AnyView(view)
        
        return AnyView(view)
    }
}
