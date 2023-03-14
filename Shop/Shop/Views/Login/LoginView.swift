//
//  LogingView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

// Login Screen

//struct LoginView: View {
//    @ObservedObject var viewModel: LoginViewModel
//
//    var body: some View {
//        VStack {
//            Text("Welcome to the Login Screen")
//                .font(.headline)
//
//            TextField("Username", text: $viewModel.username)
//                .padding()
//
//            SecureField("Password", text: $viewModel.password)
//                .padding()
//
//            Button(action: {
//                viewModel.login()
//            }, label: {
//                Text("Login")
//            })
//            .padding()
//        }
//    }
//}

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Login View")
                .font(.title)
                .fontWeight(.bold)
        }
        .onAppear {
            DispatchQueue.main.async {
                self.viewModel.goToMainView()
            }
        }
    }
}
