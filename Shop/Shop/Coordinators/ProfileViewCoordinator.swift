//
//  ProfileViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class ProfileViewCoordinator: Coordinator {
    func start() -> AnyView {
        let viewModel = ProfileViewModel()
        let view = ProfileView(viewModel: viewModel, coordinator: self)
        return AnyView(view)
    }
    
    private func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    private func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func back() {
        parentCoordinator?.removeChildCoordinator(self)
    }
}
