//
//  PersonInfoAssembly.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import SwiftUI

class PersonInfoAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        let viewModel = PersonInfoViewModel(
            coordinator: dependencies.personInfoCoordinator,
            loginCoordinator: dependencies.loginCoordinator,
            userRepository: userRepository
        )
        let view = PersonInfoView(viewModel: viewModel)
        dependencies.personInfoCoordinator.view = AnyView(view)
        
        return AnyView(view)
    }
}
