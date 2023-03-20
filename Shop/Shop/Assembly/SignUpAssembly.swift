//
//  SignUpAssembly.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import SwiftUI

class SignUpAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        let viewModel = SignUpViewModel(coordinator: dependencies.signUpCoordinator, loginCoordinator: dependencies.loginCoordinator, mainCoordinator: dependencies.mainCoordinator, userRepository: userRepository)
        let view = SignUpView(viewModel: viewModel)
        dependencies.signUpCoordinator.view = AnyView(view)
        
        return AnyView(view)
    }
}
