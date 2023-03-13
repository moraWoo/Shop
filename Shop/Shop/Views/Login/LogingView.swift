//
//  LogingView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            // Отображение ошибки входа
            if let error = viewModel.error {
                Text(error.localizedDescription)
            }
            
            // Ввод логина и пароля
            TextField("Логин", text: $viewModel.login)
            SecureField("Пароль", text: $viewModel.password)
            
            // Кнопка входа
            Button("Войти") {
                viewModel.login()
            }
        }
    }
}
