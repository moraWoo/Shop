import SwiftUI
import Combine

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let name: String = "Login Coordinator"

    func start() -> AnyPublisher<AnyView, Never> {
        guard let parent = parentCoordinator as? AppCoordinator,
              let dependencies = parent.dependencies else {
            fatalError("Parent coordinator is not set or dependencies not found.")
        }

        let loginAssembly = LoginAssembly(dependencies: dependencies)
        return Just(loginAssembly.assemble(appCoordinator: parent)).eraseToAnyPublisher()
    }
}
