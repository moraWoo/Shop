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
//        DispatchQueue.main.async {
            let signUpView = SignUpAssembly(dependencies: self.dependencies, signUpCoordinator: signUpCoordinator).assemble()
            self.currentView = signUpCoordinator.start()
//        }
    }

    func showLogin() {
        let loginCoordinator = LoginCoordinator(dependencies: dependencies)
        addChildCoordinator(loginCoordinator)
        DispatchQueue.main.async {
            let loginView = LoginAssembly(dependencies: self.dependencies, loginCoordinator: loginCoordinator).assemble()
            self.currentView = AnyView(loginView)
        }
    }
    
    func showMain() {
        let mainCoordinator = MainCoordinator(dependencies: dependencies)
        addChildCoordinator(mainCoordinator)
        DispatchQueue.main.async {
            let mainView = MainAssembly(dependencies: self.dependencies, mainCoordinator: mainCoordinator).assemble()
            self.currentView = AnyView(mainView)
        }
    }
    
    func showPersonInfo() {
        let personInfoCoordinator = PersonInfoCoordinator(dependencies: dependencies)
        addChildCoordinator(personInfoCoordinator)
        DispatchQueue.main.async {
            let personInfoView = PersonInfoAssembly(dependencies: self.dependencies, personInfoCoordinator: personInfoCoordinator).assemble()
            self.currentView = AnyView(personInfoView)
        }
    }
    
    func showDetail() {
        let detailCoordinator = DetailCoordinator(dependencies: dependencies)
        addChildCoordinator(detailCoordinator)
        DispatchQueue.main.async {
            let detailView = DetailAssembly(dependencies: self.dependencies, detailCoordinator: detailCoordinator).assemble()
            self.currentView = AnyView(detailView)
        }
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
