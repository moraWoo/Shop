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
        guard childCoordinators.isEmpty == false else {
            let mainCoordinator = MainCoordinator()
            addChildCoordinator(mainCoordinator)
            mainCoordinator.start()
            return currentView
        }
        currentView = AnyView(childCoordinators.last?.start())
        return currentView
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}


