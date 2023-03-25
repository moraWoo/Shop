import SwiftUI
import Combine

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var view: AnyView?
    let userRepository = UserRepository()
    let networkManager = NetworkManager()
    
    func start() -> AnyView {
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: LoginCoordinator(),
            mainCoordinator: self,
            personInfoCoordinator: PersonInfoCoordinator(),
            detailCoordinator: DetailCoordinator(),
            userRepository: userRepository,
            networkManager: networkManager
        )
        let mainView = MainAssembly(dependencies: dependencies).assemble(userRepository: userRepository)
        view = AnyView(mainView)
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
            guard let self = self else { return }
            
            let mainView = MainView(
                viewModel: MainViewModel(
                    coordinator: self,
                    personInfoCoordinator: personInfoCoordinator,
                    userRepository: self.userRepository,
                    networkManager: self.networkManager
                )
            )
            self.view = AnyView(mainView)
        }
    }
}
