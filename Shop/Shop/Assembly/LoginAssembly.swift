import SwiftUI

class LoginAssembly {
    
    let dependencies: AppDependencies
    let loginCoordinator: LoginCoordinator

    init(dependencies: AppDependencies, loginCoordinator: LoginCoordinator) {
        self.dependencies = dependencies
        self.loginCoordinator = loginCoordinator
    }
    
    func assemble() -> some View {
        let viewModel = LoginViewModel(appCoordinator: loginCoordinator.parentCoordinator as! AppCoordinator, loginCoordinator: loginCoordinator)
        let view = LoginView(viewModel: viewModel)
        return AnyView(view)
    }
}
