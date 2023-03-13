//
//  MainViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    private let coordinator: MainViewCoordinator
     
     init(coordinator: MainViewCoordinator) {
         self.coordinator = coordinator
     }
     
     func profileTapped() {
         coordinator.showProfileView()
     }
     
     func detailsTapped() {
         coordinator.showDetailsView()
     }
}
