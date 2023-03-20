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
    
    func assemble(userRepository: UserRepository) -> some View {
        print("MainAssembly assemble()")
        let viewModel = MainViewModel(
            coordinator: dependencies.mainCoordinator,
            personInfoCoordinator: dependencies.personInfoCoordinator,
            userRepository: userRepository
        )
        let view = MainView(viewModel: viewModel)
        dependencies.mainCoordinator.view = AnyView(view)

        return AnyView(view)
    }
}
