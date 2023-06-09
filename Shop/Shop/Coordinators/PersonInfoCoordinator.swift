import Combine
import SwiftUI

class PersonInfoCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  var parentCoordinator: Coordinator?
  let dependencies: AppDependencies
  let name: String = "PersonInfo Coordinator"

  init(dependencies: AppDependencies) {
    self.dependencies = dependencies
  }

  func start() -> AnyView {
    let personInfoView = PersonInfoAssembly(dependencies: dependencies, personInfoCoordinator: self).assemble()
    return AnyView(personInfoView)
  }
}
