import Combine
import SwiftUI

class LoginCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  var parentCoordinator: Coordinator?
  let dependencies: AppDependencies
  let name: String = "Login Coordinator"

  init(dependencies: AppDependencies) {
    self.dependencies = dependencies
  }

  func start() -> AnyView {
    let loginView = LoginAssembly(dependencies: dependencies, loginCoordinator: self).assemble()
    return AnyView(loginView)
  }
}
