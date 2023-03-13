//
//  MainView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        VStack {
            // Навигация по экранам
            Button("Мой профиль") {
                viewModel.navigateToProfile()
            }
            Button("Детали") {
                viewModel.navigateToDetails()
            }
        }
    }
}
