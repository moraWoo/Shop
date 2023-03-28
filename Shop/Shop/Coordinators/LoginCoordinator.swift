import SwiftUI
import Combine

class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var view: AnyView?
    let userRepository = UserRepository()
    let name: String = "Login Coordinator"

    func start() -> AnyView {
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: self,
            mainCoordinator: MainCoordinator(),
            personInfoCoordinator: PersonInfoCoordinator(),
            detailCoordinator: DetailCoordinator(),
            userRepository: userRepository
        )
        let loginView = LoginAssembly(dependencies: dependencies).assemble(userRepository: userRepository)
        view = AnyView(loginView)
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



