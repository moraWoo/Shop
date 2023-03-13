//
//  AppCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject, Coordinator {
    
    @Published var currentView: AnyView = AnyView(Text(""))

    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?

    let viewAssembly: ViewAssembly
     
    init(viewAssembly: ViewAssembly) {
        self.viewAssembly = viewAssembly
        self.currentView = AnyView(viewAssembly.createMainView())
//        super.init()
    }
    
    func start() -> AnyView {
        let signInView = viewAssembly.createSignInView()
        self.currentView = AnyView(signInView)
        
        // Показать главное представление после входа в систему
        showMainView()
        
        return self.currentView
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func showMainView() {
        let mainViewCoordinator = MainViewCoordinator(viewAssembly: viewAssembly)
        addChildCoordinator(mainViewCoordinator)
        currentView = mainViewCoordinator.start()
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
}
