import SwiftUI
import Combine

class PersonInfoCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let name: String = "PersonInfo Coordinator"

    func start() -> AnyPublisher<AnyView, Never> {
        guard let parent = parentCoordinator as? AppCoordinator,
              let dependencies = parent.dependencies else {
            fatalError("Parent coordinator is not set or dependencies not found.")
        }

        let personInfoAssembly = PersonInfoAssembly(dependencies: dependencies)
        return Just(personInfoAssembly.assemble(appCoordinator: parent)).eraseToAnyPublisher()
    }
}
