import SwiftUI

class LoginAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        
        guard let loginCoordinator = dependencies.loginCoordinator,
              let mainCoordinator = dependencies.mainCoordinator else {
            fatalError("LoginCoordinator or MainCoordinator is missing")
        }
        
        let viewModel = LoginViewModel(
            coordinator: loginCoordinator,
            mainCoordinator: mainCoordinator,
            userRepository: dependencies.userRepository
        )
        let view = LoginView(viewModel: viewModel)
        loginCoordinator.view = AnyView(view)

        return AnyView(view)
    }
}
