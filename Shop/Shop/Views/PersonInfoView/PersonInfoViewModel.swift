//
//  ProfileViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class PersonInfoViewModel: ObservableObject {
        var coordinator: PersonInfoCoordinator
        
        init(coordinator: PersonInfoCoordinator) {
            self.coordinator = coordinator
        }
    }
