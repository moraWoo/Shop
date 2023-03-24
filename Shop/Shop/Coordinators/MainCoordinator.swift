import SwiftUI
import Combine

class MainCoordinator: Coordinator {
    var view: AnyView?
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    let userRepository = UserRepository()
    
    func start() -> AnyView {
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: LoginCoordinator(),
            mainCoordinator: self,
            personInfoCoordinator: PersonInfoCoordinator(),
            detailCoordinator: DetailCoordinator()
        )
        let mainView = MainAssembly(dependencies: dependencies).assemble(userRepository: userRepository)
        view = AnyView(mainView)
        print("View from MainCoordinator \(String(describing: view))")
        if let view = view {
            return view
        } else {
            return AnyView(EmptyView())
        }
    }
    
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        guard let appCoordinator = parentCoordinator as? AppCoordinator else {
            return
        }
        appCoordinator.addChildCoordinator(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
            coordinator.parentCoordinator = nil
            view = nil
        }
    }
    
    func goToMainView() {
        
        let personInfoCoordinator = PersonInfoCoordinator()

        DispatchQueue.main.async { [weak self] in
            let mainView = MainView(viewModel: MainViewModel(coordinator: self!, personInfoCoordinator: personInfoCoordinator, userRepository: self!.userRepository))
            self?.view = AnyView(mainView)
        }
    }
    
    
}
