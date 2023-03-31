import SwiftUI
import Combine

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let name: String = "Main Coordinator"

    func start() -> AnyPublisher<AnyView, Never> {
        guard let parent = parentCoordinator as? AppCoordinator,
              let dependencies = parent.dependencies else {
            fatalError("Parent coordinator is not set or dependencies not found.")
        }

        let mainAssembly = MainAssembly(dependencies: dependencies)
        return Just(mainAssembly.assemble(appCoordinator: parent)).eraseToAnyPublisher()
    }
}
