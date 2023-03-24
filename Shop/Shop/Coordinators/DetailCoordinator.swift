import SwiftUI
import Combine

class DetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var view: AnyView?
    let userRepository = UserRepository()
    
    func start() -> AnyView {
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: LoginCoordinator(),
            mainCoordinator: MainCoordinator(),
            personInfoCoordinator: PersonInfoCoordinator(),
            detailCoordinator: self,
            userRepository: userRepository
        )
        let detailView = DetailAssembly(dependencies: dependencies).assemble()
        view = AnyView(detailView)
        print("View from DetailCoordinator \(String(describing: view))")
        if let view = view {
            return view
        } else {
            return AnyView(EmptyView())
        }
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
            coordinator.parentCoordinator = nil
            view = nil
        }
    }
}
