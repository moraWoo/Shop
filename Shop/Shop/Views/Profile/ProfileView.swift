//
//  ProfileView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            // Отображение профиля пользователя
            Text("Логин: \(viewModel.user.login)")
            Text("Имя: \(viewModel.user.name)")
            
            // Кнопка выхода из аккаунта
            Button("Выйти") {
                viewModel.signOut()
            }
        }
    }
}
