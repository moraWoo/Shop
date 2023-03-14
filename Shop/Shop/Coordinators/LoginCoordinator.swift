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
        guard let mainCoordinator = parentCoordinator as? MainCoordinator else {
            fatalError("parentCoordinator must not be nil or not be of type MainCoordinator")
        }
        let dependencies = AppDependencies(loginCoordinator: self, mainCoordinator: mainCoordinator)
        let loginView = LoginAssembly(dependencies: dependencies).assemble()
        view = AnyView(loginView)
        return view!
    }
}


