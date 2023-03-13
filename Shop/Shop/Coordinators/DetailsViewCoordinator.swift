//
//  DetailsViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class DetailsViewCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var currentView: AnyView = AnyView(Text("Details view"))
    
    override init() {}
    
    func start() -> AnyView {
        let viewModel = DetailsViewModel()
        let view = DetailsView(viewModel: viewModel)
        return AnyView(view)
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
