//
//  CustomTextField.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import SwiftUI

//struct CustomTextField: View {
//    
//    private var title: String
//    private var text: Binding<String>
//    private var prompt: String?
//    private var isSecure: Bool
//    
//    init(text: Binding<String>, prompt: String? = nil, isSecure: Bool = false) {
//        self.text = text
//        self.prompt = prompt
//    }
//    
//    var body: some View {
//        
//        VStack(alignment: .leading) {
//            
//            if isSecure {
//                SecureField(title, text: text)
//                    .textFieldStyle(CustomTextFieldStyle())
//                    .background(prompt == nil ? Color.white.opacity(0.1) : Color.red.opacity(0.15))
//                    .cornerRadius(10)
//            } else  {
//                TextField(title, text: text)
//                    .textFieldStyle(CustomTextFieldStyle())
//                    .background(prompt == nil ? Color.white.opacity(0.1) : Color.red.opacity(0.15))
//                    .cornerRadius(10)
//            }
//            
//            if let prompt = prompt {
//                Text(prompt)
//                    .foregroundColor(.red)
//                    .font(.caption)
//                    .padding(.horizontal)
//            }
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//    }
//}
