//
//  ProfileViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    private let coordinator: ProfileViewCoordinator

    init(coordinator: ProfileViewCoordinator) {
        self.coordinator = coordinator
    }

    func backTapped() {
        coordinator.back()
    }
}
