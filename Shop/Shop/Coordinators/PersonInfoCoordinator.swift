import SwiftUI
import Combine

class PersonInfoCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var view: AnyView?
    let userRepository = UserRepository()

    func start() -> AnyView {
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: LoginCoordinator(),
            mainCoordinator: MainCoordinator(),
            personInfoCoordinator: self,
            detailCoordinator: DetailCoordinator(),
            userRepository: userRepository
        )
        let personInfoView = PersonInfoAssembly(dependencies: dependencies).assemble(userRepository: userRepository)
        view = AnyView(personInfoView)
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
