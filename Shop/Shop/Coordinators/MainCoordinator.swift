//
//  MainViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class MainCoordinator: Coordinator {
    var view: AnyView?
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    func start() -> AnyView {
        let mainView = MainView(viewModel: MainViewModel(coordinator: self))
        view = AnyView(mainView)
        return view!
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
    
    func goToMainView() {
        let mainView = MainView(viewModel: MainViewModel(coordinator: self))
        view = AnyView(mainView)
    }
}
