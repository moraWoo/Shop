//
//  ProfileViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class ProfileViewCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var currentView: AnyView = AnyView(Text("Details view"))
    
    override init() {}
    
    func start() -> AnyView {
        let viewModel = ProfileViewModel()
        let view = ProfileView(viewModel: viewModel)
        return AnyView(view)
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func back() {
        parentCoordinator?.removeChildCoordinator(self)
    }
}
