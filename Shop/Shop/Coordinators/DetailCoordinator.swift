import SwiftUI
import Combine

class DetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let name: String = "Detail Coordinator"

    func start() -> AnyPublisher<AnyView, Never> {
        guard let parent = parentCoordinator as? AppCoordinator,
              let dependencies = parent.dependencies else {
            fatalError("Parent coordinator is not set or dependencies not found.")
        }

        let detailAssembly = DetailAssembly(dependencies: dependencies)
        return Just(detailAssembly.assemble(appCoordinator: parent)).eraseToAnyPublisher()
    }
}
