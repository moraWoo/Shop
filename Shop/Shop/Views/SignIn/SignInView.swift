//
//  SingInView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

struct SignInView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack {
            // Ввод логина и пароля
            TextField("Логин", text: $viewModel.login)
            SecureField("Пароль", text: $viewModel.password)
            
            // Кнопка входа
            Button("Войти") {
//                $viewModel.signIn
            }
        }
    }
}

