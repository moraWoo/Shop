//
//  LoginAssembly.swift
//  Shop
//
//  Created by Ильдар on 14.03.2023.
//

import SwiftUI

class LoginAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble() -> some View {
        let viewModel = LoginViewModel(coordinator: dependencies.loginCoordinator)
        let view = LoginView(viewModel: viewModel)
        dependencies.loginCoordinator.view = AnyView(view)
        
        return AnyView(view)
    }
}
