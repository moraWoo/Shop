//
//  DetailsViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class DetailViewModel: ObservableObject {
    var coordinator: DetailCoordinator
    
    init(coordinator: DetailCoordinator) {
        self.coordinator = coordinator
    }
}

