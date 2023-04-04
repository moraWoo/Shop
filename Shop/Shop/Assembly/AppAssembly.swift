import SwiftUI

enum AppAssembly {
  static func assemble(dependencies: AppDependencies) -> AppCoordinator {
    let appCoordinator = AppCoordinator(dependencies: dependencies)
    return appCoordinator
  }
}
