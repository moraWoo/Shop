//
//  SingUpView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    @State private var showingAlertTextFieldsIsEmpty = false
    @State private var showPasswordInput = false
    
    var body: some View {
        VStack(spacing: 70) {
            Text("Sign in")
                .customFont(size: 26, weight: .semibold)
            VStack(spacing: 15) {
                VStack(spacing: 35) {
                    CustomTextField(title: "First name", text: $viewModel.firstName, prompt: viewModel.firstNamePrompt)
                    CustomTextField(title: "Last name", text: $viewModel.lastName, prompt: viewModel.lastNamePrompt)
                    CustomTextField(title: "Email", text: $viewModel.email, prompt: viewModel.emailPrompt)
                    Button {
                        if viewModel.firstName.isEmpty || viewModel.lastName.isEmpty || viewModel.email.isEmpty {
                            showingAlertTextFieldsIsEmpty = true
                        } else {
                            print("Sign in...")
                            showPasswordInput = true
                        }
                    } label: {
                        Text("Sign in")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .alert("Fields are not filled", isPresented: $showingAlertTextFieldsIsEmpty) {
                        Button("OK", role: .cancel) { }
                    }
                    .alert(isPresented: $viewModel.showErrorAlert) {
                        Alert(title: Text("User exist"),
                              message: Text("Choose another name"),
                              dismissButton: .default(Text("OK")))
                    }
                }
                HStack() {
                    Text("Already have an account?")
                        .customFont(size: 10, weight: .medium)
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                    Button {
                        viewModel.login()
                    } label: {
                        Text("Log in")
                            .customFont(size: 10, weight: .medium)
                    }
                    Spacer()
                }
            }
            
            VStack(spacing: 38) {
                Button {
                    viewModel.login()
                } label: {
                    Image("googleLogo")
                    Text("Sign in with Google")
                        .customFont(size: 12, weight: .medium)
                        .foregroundColor(.black)
                }
                
                Button {
                    viewModel.login()
                } label: {
                    Image("appleLogo")
                    Text("Sign in with Apple")
                        .customFont(size: 12, weight: .medium)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.leading, 43)
        .padding(.trailing, 43)
        .sheet(isPresented: $showPasswordInput) {
            VStack {
                Text("Enter your password")
                    .font(.headline)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Submit") {
                    viewModel.signUp()
                }
            }
        }
    }
}
