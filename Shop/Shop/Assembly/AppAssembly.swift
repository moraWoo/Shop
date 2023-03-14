//
//  AppAssembly.swift
//  Shop
//
//  Created by Ильдар on 14.03.2023.
//

import SwiftUI

class AppAssembly {
    
    static func assemble() -> some View {
        let appCoordinator = AppCoordinator()
        let dependencies = AppDependencies(loginCoordinator: LoginCoordinator(), mainCoordinator: MainCoordinator())
        
        let mainAssembly = MainAssembly(dependencies: dependencies)
        let loginAssembly = LoginAssembly(dependencies: dependencies)
        
        appCoordinator.addChildCoordinator(mainAssembly.dependencies.mainCoordinator)
        appCoordinator.addChildCoordinator(loginAssembly.dependencies.loginCoordinator)
        
        return AnyView(loginAssembly.assemble())
    }
}
