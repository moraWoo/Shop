//
//  LoginViewCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var view: AnyView?
    
    func start() -> AnyView {
        let dependencies = AppDependencies(loginCoordinator: self, mainCoordinator: MainCoordinator())
        let loginView = LoginAssembly(dependencies: dependencies).assemble()
        view = AnyView(loginView)
        print("View from LoginCoordinator")
        if let view = view {
            return view
        } else {
            return AnyView(EmptyView())
        }
    }
}


