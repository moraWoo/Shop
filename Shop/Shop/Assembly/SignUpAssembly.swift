import SwiftUI

class SignUpAssembly {
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(appCoordinator: AppCoordinator) -> AnyView {
        let signUpCoordinator = SignUpCoordinator()
        signUpCoordinator.parentCoordinator = appCoordinator
        
        let viewModel = SignUpViewModel(
            coordinator: signUpCoordinator,
            userRepository: dependencies.userRepository
        )
        
        let view = SignUpView(viewModel: viewModel)
        return AnyView(view)
    }
}

