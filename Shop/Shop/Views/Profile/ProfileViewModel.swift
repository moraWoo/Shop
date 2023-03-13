//
//  ProfileViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User = User(login: "", name: "")
    
    func signOut() {
        // Выход из аккаунта
        // ...
    }
}
