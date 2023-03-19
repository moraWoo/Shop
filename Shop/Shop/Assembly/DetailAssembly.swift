//
//  DetailAssembly.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import SwiftUI

class DetailAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble() -> some View {
        let viewModel = DetailViewModel(coordinator: dependencies.detailCoordinator)
        let view = DetailView(viewModel: viewModel)
        dependencies.detailCoordinator.view = AnyView(view)
        
        return AnyView(view)
    }
}
