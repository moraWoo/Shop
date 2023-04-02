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
}
