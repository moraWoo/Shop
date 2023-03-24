import SwiftUI

class SignUpAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        guard let signUpCoordinator = dependencies.signUpCoordinator,
              let loginCoordinator = dependencies.loginCoordinator,
              let mainCoordinator = dependencies.mainCoordinator else {
            fatalError("SignUpCoordinator, LoginCoordinator, or MainCoordinator is missing")
        }
        
        let viewModel = SignUpViewModel(
            coordinator: signUpCoordinator,
            loginCoordinator: loginCoordinator,
            mainCoordinator: mainCoordinator,
            userRepository: dependencies.userRepository
        )
        let view = SignUpView(viewModel: viewModel)
        signUpCoordinator.view = AnyView(view)

        return AnyView(view)
    }
}
