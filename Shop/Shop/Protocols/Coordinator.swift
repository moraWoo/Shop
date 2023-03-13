//
//  Coordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var currentView: AnyView { get set }
    
    func start() -> AnyView
    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
}
