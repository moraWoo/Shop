//
//  MainViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class MainViewCoordinator: NSObject, Coordinator {
    var currentView: AnyView
    
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
//    var currentView: AnyView {
//        let viewModel = MainViewModel(coordinator: self)
//        let view = MainView(viewModel: viewModel)
//        return AnyView(view)
//    }
    
    
    let viewAssembly: ViewAssembly
    
    init(viewAssembly: ViewAssembly) {
        self.viewAssembly = viewAssembly
        self.currentView = AnyView(viewAssembly.createMainView())
        super.init()
    }

    func start() -> AnyView {
        return currentView
    }
    
    func showDetailsView() {
        let detailsViewCoordinator = DetailsViewCoordinator()
        addChildCoordinator(detailsViewCoordinator)
        currentView = detailsViewCoordinator.start()
    }
    
    func showProfileView() {
        let profileViewCoordinator = ProfileViewCoordinator()
        addChildCoordinator(profileViewCoordinator)
        currentView = profileViewCoordinator.start()
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
