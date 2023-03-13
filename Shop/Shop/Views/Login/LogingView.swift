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
            // ... view content
            Button("Sign Up") {
                viewModel.signUpTapped()
            }
        }
    }
}

struct LogingView_Previews: PreviewProvider {
    static var previews: some View {
        LogingView()
    }
}
