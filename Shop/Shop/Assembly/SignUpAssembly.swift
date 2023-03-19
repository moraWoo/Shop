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
    
    func assemble() -> some View {
        let viewModel = SignUpViewModel(coordinator: dependencies.signUpCoordinator)
        let view = SignUpView(viewModel: viewModel)
        dependencies.signUpCoordinator.view = AnyView(view)
        
        return AnyView(view)
    }
}
