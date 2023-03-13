//
//  LoginViewModel.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var login = ""
    @Published var password = ""
    @Published var error: Error?
    
    func login() {
        // Вход в аккаунт
        // ...
    }
}
