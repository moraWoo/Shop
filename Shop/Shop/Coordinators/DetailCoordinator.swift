import SwiftUI
import Combine

class DetailCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var view: AnyView?
    let userRepository = UserRepository()
    let networkManager = NetworkManager()
    let navigationManager = NavigationManager()
    let name: String = "Detail Coordinator"

    func start() -> AnyView {
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: LoginCoordinator(),
            mainCoordinator: MainCoordinator(),
            personInfoCoordinator: PersonInfoCoordinator(),
            detailCoordinator: self,
            userRepository: userRepository,
            networkManager: networkManager,
            navigationManager: navigationManager
        )
        let detailView = DetailAssembly(dependencies: dependencies).assemble()
        view = AnyView(detailView)
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
