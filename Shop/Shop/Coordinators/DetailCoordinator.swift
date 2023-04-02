import SwiftUI
import Combine

class DetailCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let dependencies: AppDependencies
    let name: String = "Detail Coordinator"

    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func start() -> AnyView {
        let detailView = DetailAssembly(dependencies: dependencies, detailCoordinator: self).assemble()
        return AnyView(detailView)
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
            coordinator.parentCoordinator = nil
        }
    }
}
