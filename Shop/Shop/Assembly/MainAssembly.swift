//
//  MainAssembly.swift
//  Shop
//
//  Created by Ильдар on 14.03.2023.
//

import SwiftUI

class MainAssembly {
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble() -> some View {
        print("MainAssembly assemble()")
        let viewModel = MainViewModel(coordinator: dependencies.mainCoordinator)
        let view = MainView(viewModel: viewModel)
        dependencies.mainCoordinator.view = AnyView(view)
        
        // Set the parent coordinator of LoginCoordinator
        let loginCoordinator = LoginCoordinator()
        loginCoordinator.parentCoordinator = dependencies.mainCoordinator
        
        dependencies.loginCoordinator = loginCoordinator
        
        return AnyView(view)

    }
}
