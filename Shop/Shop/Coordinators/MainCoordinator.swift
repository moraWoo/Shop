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
        print("MainCoordinator start()")
        let mainView = MainView(viewModel: MainViewModel(coordinator: self))
        view = AnyView(mainView)
        parentCoordinator?.addChildCoordinator(self)
        return view!
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
        DispatchQueue.main.async { [weak self] in
            let mainView = MainView(viewModel: MainViewModel(coordinator: self!))
            self?.view = AnyView(mainView)
        }
    }
}
