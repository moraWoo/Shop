import SwiftUI

class LoginAssembly {
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(appCoordinator: AppCoordinator, loginCoordinator: LoginCoordinator) -> AnyView {
        let viewModel = LoginViewModel(
            coordinator: loginCoordinator,
            userRepository: dependencies.userRepository
        )
        
        let view = LoginView(viewModel: viewModel)
            .environmentObject(appCoordinator)
        return AnyView(view)
    }
}

