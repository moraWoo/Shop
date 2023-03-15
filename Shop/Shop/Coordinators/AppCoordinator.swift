//
//  AppCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject, Coordinator {
    @Published var currentView: AnyView = AnyView(EmptyView())
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    func start() -> AnyView {
        print("AppCoordinator start()")
        guard childCoordinators.isEmpty == false else {
            let loginCoordinator = LoginCoordinator()
            addChildCoordinator(loginCoordinator)
            return loginCoordinator.start()
        }
        currentView = AnyView(childCoordinators.last?.start())
        return currentView
    }
    
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        print("Adding child coordinator in AppCoordinator: \(coordinator)")
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {

        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            print("Removing child coordinator in AppCoordinator: \(coordinator)")
            childCoordinators.remove(at: index)
            coordinator.parentCoordinator = nil
        }
    }
}
