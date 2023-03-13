//
//  AppCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject {
    @Published var currentView: AnyView
    
    private var childCoordinators = [Coordinator]()
    
    init() {
        let loginViewCoordinator = LoginViewCoordinator()
        addChildCoordinator(loginViewCoordinator)
        currentView = loginViewCoordinator.start()
    }
    
    private func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    private func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func showMainView() {
        let mainViewCoordinator = MainViewCoordinator()
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
