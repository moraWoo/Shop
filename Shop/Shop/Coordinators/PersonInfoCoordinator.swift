import SwiftUI
import Combine

class PersonInfoCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let dependencies: AppDependencies
    let name: String = "Sign Up Coordinator"

    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func start() -> AnyView {
        let personInfoView = PersonInfoAssembly(dependencies: dependencies, personInfoCoordinator: self).assemble()
        return AnyView(personInfoView)
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
