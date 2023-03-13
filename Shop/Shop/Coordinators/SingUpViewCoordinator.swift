////
////  SingUpViewCoordinator.swift
////  Shop
////
////  Created by Ильдар on 13.03.2023.
////
//
//import SwiftUI
//import Combine
//
//class SignUpViewCoordinator: Coordinator {
//    var childCoordinators: [Coordinator] = []
//    var parentCoordinator: Coordinator?
//    var currentView: AnyView {
//        let viewModel = SignUpViewModel(coordinator: self)
//        let view = SignUpView(viewModel: viewModel)
//        return AnyView(view)
//    }
//    
//    func start() -> AnyView {
//        return currentView
//    }
//    
//    func addChildCoordinator(_ coordinator: Coordinator) {
//        childCoordinators.append(coordinator)
//    }
//    
//    func removeChildCoordinator(_ coordinator: Coordinator) {
//        childCoordinators = childCoordinators.filter { $0 !== coordinator }
//    }
//}
