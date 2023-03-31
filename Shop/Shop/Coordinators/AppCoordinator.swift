import SwiftUI
import Combine

class AppCoordinator: ObservableObject, Coordinator {
    @Published var currentView: AnyView = AnyView(EmptyView())
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var dependencies: AppDependencies?

    let name: String = "App Coordinator"

    
    func start() -> AnyPublisher<AnyView, Never> {
        if childCoordinators.isEmpty {
            let signUpCoordinator = SignUpCoordinator()
            signUpCoordinator.parentCoordinator = self
            addChildCoordinator(signUpCoordinator)
            return signUpCoordinator.start().map { AnyView($0) }.eraseToAnyPublisher()
        } else {
            return Just(currentView).eraseToAnyPublisher()
        }
    }
    
    func printChildCoordinators(indentationLevel: Int = 0) {
        let indentation = String(repeating: " ", count: indentationLevel)
        print("\(indentation)\(name)")
        for child in childCoordinators {
            child.printChildCoordinators(indentationLevel: indentationLevel + 2)
        }
    }
    
    func navigateToLogin() {
        let loginCoordinator = LoginCoordinator()
        addChildCoordinator(loginCoordinator)
        loginCoordinator.start()
            .map { AnyView($0) }
            .sink { [weak self] view in
                self?.currentView = view
            }
            .store(in: &subscriptions)
    }
    
    func navigateToMain() {
        let mainCoordinator = MainCoordinator()
        addChildCoordinator(mainCoordinator)
        mainCoordinator.start()
            .map { AnyView($0) }
            .sink { [weak self] view in
                self?.currentView = view
            }
            .store(in: &subscriptions)
    }
    
    private var subscriptions = Set<AnyCancellable>()
}
