//
//  SingUpViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class SignUpViewModel: ObservableObject {
    var coordinator: SignUpCoordinator
    
    init(coordinator: SignUpCoordinator) {
        self.coordinator = coordinator
    }
}
