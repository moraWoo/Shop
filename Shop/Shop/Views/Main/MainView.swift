//
//  MainView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

// Main Screen

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Main Screen")
                    .font(.headline)
                Button(action: {
                    viewModel.logout()
                }, label: {
                    Text("Logout")
                })
                .padding()
            }
            .navigationTitle("Main Screen")
        }
    }
}
