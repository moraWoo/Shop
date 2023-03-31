import SwiftUI
import Combine

class SignUpCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let name: String = "Sign Up Coordinator"

    func start() -> AnyPublisher<AnyView, Never> {
        guard let parent = parentCoordinator as? AppCoordinator,
              let dependencies = parent.dependencies else {
            fatalError("Parent coordinator is not set or dependencies not found.")
        }

        let signUpAssembly = SignUpAssembly(dependencies: dependencies)
        let view = signUpAssembly.assemble(appCoordinator: parent)
        parent.currentView = view

        return Empty().eraseToAnyPublisher()
    }
}

