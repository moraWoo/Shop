import SwiftUI
import Combine

class AppCoordinator: ObservableObject, Coordinator {
    
    @Published var currentView: AnyView = AnyView(EmptyView())
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    let name: String = "App Coordinator"
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func start() -> AnyView {
        showSignUp()
        return currentView
    }
}

extension AppCoordinator {
    
    func showSignUp() {
        let signUpCoordinator = SignUpCoordinator(dependencies: dependencies)
        addChildCoordinator(signUpCoordinator)
        let signUpView = SignUpAssembly(dependencies: dependencies, signUpCoordinator: signUpCoordinator).assemble()
        currentView = AnyView(signUpView)
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(dependencies: dependencies)
        addChildCoordinator(loginCoordinator)
        let loginView = LoginAssembly(dependencies: dependencies, loginCoordinator: loginCoordinator).assemble()
        currentView = AnyView(loginView)
    }
    
    func showMain() {
        let mainCoordinator = MainCoordinator(dependencies: dependencies)
        addChildCoordinator(mainCoordinator)
        let mainView = MainAssembly(dependencies: dependencies, mainCoordinator: mainCoordinator).assemble()
        currentView = AnyView(mainView)
    }
}

extension AppCoordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
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
