import SwiftUI
import Combine

class SignUpCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let dependencies: AppDependencies
    let name: String = "Sign Up Coordinator"

    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func start() -> AnyView {
        let signUpView = SignUpAssembly(dependencies: dependencies, signUpCoordinator: self).assemble()
        return AnyView(signUpView)
    }
}
