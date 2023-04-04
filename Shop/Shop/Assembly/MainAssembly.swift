import SwiftUI

class MainAssembly {
  let dependencies: AppDependencies
  let mainCoordinator: MainCoordinator

  init(dependencies: AppDependencies, mainCoordinator: MainCoordinator) {
    self.dependencies = dependencies
    self.mainCoordinator = mainCoordinator
  }

  func assemble() -> some View {
    guard let appCoordinator = mainCoordinator.parentCoordinator as? AppCoordinator else {
      print("Error: mainCoordinator.parentCoordinator is not an instance of the AppCoordinator class.")
      return AnyView(EmptyView())
    }
    let viewModel = MainViewModel(appCoordinator: appCoordinator, mainCoordinator: mainCoordinator)
    let view = MainView(viewModel: viewModel)
    return AnyView(view)
  }
}
