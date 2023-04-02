import SwiftUI

class SignUpAssembly {
    
    let dependencies: AppDependencies
    let signUpCoordinator: SignUpCoordinator

    init(dependencies: AppDependencies, signUpCoordinator: SignUpCoordinator) {
        self.dependencies = dependencies
        self.signUpCoordinator = signUpCoordinator
    }
    
    func assemble() -> some View {
        let viewModel = SignUpViewModel(appCoordinator: signUpCoordinator.parentCoordinator as! AppCoordinator, signUpCoordinator: signUpCoordinator)
        let view = SignUpView(viewModel: viewModel)
        return AnyView(view)
    }
}
