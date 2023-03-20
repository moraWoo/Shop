//
//  LogingView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct LoginView: View, SecuredTextFieldParentProtocol {
    @ObservedObject var viewModel: LoginViewModel
    
    @State var hideKeyboard: (() -> Void)?
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 70) {
            Spacer()
            Text("Welcome back")
                .customFont(size: 26, weight: .semibold)
            VStack(spacing: 35) {
                CustomTextField(title: "First name", text: $viewModel.firstName, prompt: viewModel.firstNamePrompt)
                SecuredTextFieldView(text: $viewModel.password, parent: self)
            }.padding(.leading, 43)
                .padding(.trailing, 43)
            
            VStack {
                Button {
                    print("Login...")
                    showingAlert.toggle()
                    performHideKeyboard()
                    viewModel.successfulLogin()
                } label: {
                    Text("Login")
                }.buttonStyle(PrimaryButtonStyle())
//                    .alert(viewModel.password, isPresented: $showingAlert) {
//                        Button("OK", role: .cancel) { }
//                    }.padding(.top, 30)
                Spacer()
            }
            .padding(.leading, 43)
            .padding(.trailing, 43)
        }
    }
    
    private func performHideKeyboard() {
        guard let hideKeyboard = self.hideKeyboard else {
            return
        }
        hideKeyboard()
    }
}
