//
//  TopView.swift
//  Views
//
//  Created by Ильдар on 18.03.2023.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack {
            Text("Profile")
                .customFont(size: 15, weight: .bold)
                .padding(.top, 19)
            Button(action: {}) {
                Image("person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 60, height: 60)
            }
            Button {
                //
            } label: {
                Text("Change photo")
                    .customFont(size: 8, weight: .medium)
                    .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
            }
            Text("Satria Adhi Pradana")
                .customFont(size: 15, weight: .bold)
                .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                .padding(.bottom, 36)
            ZStack(alignment: .leading) {
                Button {
                    print("Login...")
                } label: {
                    Text("Upload Item")
                }.buttonStyle(PrimaryButtonStyle())
                Image("share")
                    .frame(height: 15.0, alignment: Alignment.leading)
                    .padding(.leading, 50)
                Spacer()
            }
            .padding(.leading, 43)
            .padding(.trailing, 43)
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
