import SwiftUI

class SignUpAssembly {
    
    let dependencies: AppDependencies
    let signUpCoordinator: SignUpCoordinator

    init(dependencies: AppDependencies, signUpCoordinator: SignUpCoordinator) {
        self.dependencies = dependencies
        self.signUpCoordinator = signUpCoordinator
    }
    
    func assemble() -> some View {
        guard let appCoordinator = signUpCoordinator.parentCoordinator as? AppCoordinator else {
            print("Error: signUpCoordinator.parentCoordinator is not an instance of the AppCoordinator class.")
            return AnyView(EmptyView())
        }
        let viewModel = SignUpViewModel(appCoordinator: appCoordinator, signUpCoordinator: signUpCoordinator)
        let view = SignUpView(viewModel: viewModel)
        return AnyView(view)
    }
}
