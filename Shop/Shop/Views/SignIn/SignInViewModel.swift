//
//  SingInViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var login = ""
    @Published var password = ""
    
    func signInButtonTapped() {
        // Вход в аккаунт
        // ...
    }
}
