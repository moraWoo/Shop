import SwiftUI

class LoginAssembly {
    
    let dependencies: AppDependencies
    let loginCoordinator: LoginCoordinator

    init(dependencies: AppDependencies, loginCoordinator: LoginCoordinator) {
        self.dependencies = dependencies
        self.loginCoordinator = loginCoordinator
    }
    
    func assemble() -> some View {
        guard let appCoordinator = loginCoordinator.parentCoordinator as? AppCoordinator else {
            print("Error: loginCoordinator.parentCoordinator is not an instance of the AppCoordinator class.")
            return AnyView(EmptyView())
        }
        let viewModel = LoginViewModel(appCoordinator: appCoordinator, loginCoordinator: loginCoordinator)
        let view = LoginView(viewModel: viewModel)
        return AnyView(view)
    }
}
