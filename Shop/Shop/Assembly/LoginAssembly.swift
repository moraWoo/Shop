import SwiftUI

class LoginAssembly {
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(appCoordinator: AppCoordinator) -> AnyView {
        let loginCoordinator = LoginCoordinator()
        loginCoordinator.parentCoordinator = appCoordinator
        
        let viewModel = LoginViewModel(
            coordinator: loginCoordinator,
            userRepository: dependencies.userRepository
        )
        
        let view = LoginView(viewModel: viewModel)
        return AnyView(view)
    }
}
