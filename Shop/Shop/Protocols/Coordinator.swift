import SwiftUI
import Combine

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var name: String { get }
    
    func start() -> AnyPublisher<AnyView, Never>
    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
}

extension Coordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        print("addChildCoordinator \(coordinator)")
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        print("removeChildCoordinator \(coordinator)")
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
            coordinator.parentCoordinator = nil
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
