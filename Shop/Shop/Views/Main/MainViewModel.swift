//
//  MainViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToProfile() {
//        coordinator.navigateToProfile()
    }
    
    func navigateToDetails() {
//        coordinator.navigateToDetails()
    }
}
