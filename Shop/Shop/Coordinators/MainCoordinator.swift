import SwiftUI
import Combine

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    let dependencies: AppDependencies
    let name: String = "Main Coordinator"

    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func start() -> AnyView {
        let mainView = MainAssembly(dependencies: dependencies, mainCoordinator: self).assemble()
        return AnyView(mainView)
    }
}
