//
//  SingUpView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: 70) {
            Text("Sign in")
                .customFont(size: 26, weight: .semibold)
            VStack(spacing: 15) {
                VStack(spacing: 35) {
                    TextField("First name", text: $firstName)
                        .textFieldInputData()
                    TextField("Last name", text: $lastName)
                        .textFieldInputData()
                    TextField("Email", text: $email)
                        .textFieldInputData()
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
                    Button(action: {}) {
                        Text("Log in")
                            .customFont(size: 10, weight: .medium)
                    }
                    Spacer()
                }
            }
            
            VStack(spacing: 38) {
                Button(action: {}) {
                    Image("googleLogo")
                    Text("Sign in with Google")
                        .customFont(size: 12, weight: .medium)
                        .foregroundColor(.black)
                }
                
                Button(action: {}) {
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
