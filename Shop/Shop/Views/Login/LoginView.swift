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
            Text("Login View")
                .font(.title)
                .fontWeight(.bold)
        }
        Button(action: {
            self.viewModel.login()
        }, label: {
            Text("Login")
        })
    }
}
