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
        let viewModel = MainViewModel(coordinator: dependencies.mainCoordinator)
        let view = MainView(viewModel: viewModel)
        dependencies.mainCoordinator.view = AnyView(view)
        
        return AnyView(view)
    }
}
