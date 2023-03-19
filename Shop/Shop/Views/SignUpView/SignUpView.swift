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
                        print("Sign in...")
                    } label: {
                        Text("Sign in")
                    }.buttonStyle(PrimaryButtonStyle())
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
    }
}
