//
//  DetailsViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class DetailsViewModel: ObservableObject {
    private let coordinator: DetailsViewCoordinator
    
    init(coordinator: DetailsViewCoordinator) {
        self.coordinator = coordinator
    }
    
    func backTapped() {
//        coordinator.back()
    }
}
