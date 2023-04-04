import SwiftUI

protocol Coordinator: AnyObject {
  var name: String { get }
  var childCoordinators: [Coordinator] { get set }
  var parentCoordinator: Coordinator? { get set }

  func start() -> AnyView
  func addChildCoordinator(_ coordinator: Coordinator)
  func removeChildCoordinator(_ coordinator: Coordinator)

  func printChildCoordinators(indentationLevel: Int)
}

extension Coordinator {
  func addChildCoordinator(_ coordinator: Coordinator) {
    childCoordinators.append(coordinator)
    coordinator.parentCoordinator = self
  }

  func removeChildCoordinator(_ coordinator: Coordinator) {
    if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
      childCoordinators.remove(at: index)
    }
  }

  func printChildCoordinators(indentationLevel: Int = 0) {
    let indentation = String(repeating: " ", count: indentationLevel)
    print("\(indentation)\(name)")
    for child in childCoordinators {
      child.printChildCoordinators(indentationLevel: indentationLevel + 2)
    }
  }
}
