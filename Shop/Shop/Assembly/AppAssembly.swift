//
//  AppAssembly.swift
//  Shop
//
//  Created by Ильдар on 14.03.2023.
//

import SwiftUI

class AppAssembly {
    
    static func assemble() -> some View {
        let dependencies = AppDependencies(loginCoordinator: LoginCoordinator(), mainCoordinator: MainCoordinator())
        let appCoordinator = AppCoordinator()
        let mainAssembly = MainAssembly(dependencies: dependencies)
        let loginAssembly = LoginAssembly(dependencies: dependencies)
        
        appCoordinator.addChildCoordinator(loginAssembly.dependencies.loginCoordinator)
        appCoordinator.addChildCoordinator(mainAssembly.dependencies.mainCoordinator)
        
        print("AppCoordinator child coordinators:", appCoordinator.childCoordinators)
        print("MainCoordinator parent coordinator:", mainAssembly.dependencies.mainCoordinator.parentCoordinator)
        
        return AnyView(loginAssembly.assemble())
    }
}
