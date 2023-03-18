//
//  WelcomeView.swift
//  Views
//
//  Created by Ильдар on 17.03.2023.
//

import SwiftUI

struct LoginView: View, SecuredTextFieldParentProtocol {
    @State private var firstName = ""
    @State private var password = ""
    @State var hideKeyboard: (() -> Void)?
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 70) {
            Spacer()
            Text("Welcome back")
                .customFont(size: 26, weight: .semibold)
            VStack(spacing: 35) {
                TextField("First name", text: $firstName)
                    .textFieldInputData()
                SecuredTextFieldView(text: $password, parent: self)
            }.padding(.leading, 43)
                .padding(.trailing, 43)
            
            VStack {
                Button {
                    print("Login...")
                    showingAlert.toggle()
                    performHideKeyboard()
                } label: {
                    Text("Login")
                }.buttonStyle(PrimaryButtonStyle())
                    .alert(password, isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }.padding(.top, 30)
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

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
