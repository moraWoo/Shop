//
//  DetailText.swift
//  Views
//
//  Created by Ильдар on 18.03.2023.
//

import SwiftUI

struct DetailText: View {
    var body: some View {
        VStack {
            HStack {
                Text("New balance")
                    .customFont(size: 17, weight: .semibold)
                    .foregroundColor(.black)
                Spacer()
                Text("$ 22")
                    .customFont(size: 17, weight: .semibold)
                    .foregroundColor(.black)
            }.padding(.leading, 24)
                .padding(.trailing, 24)
            
            Text("Sneakers")
                .customFont(size: 17, weight: .semibold)
                .foregroundColor(.black)
            
            Text("Features waterproof, fire, air resistant shoes. all changed when the country of fire attacked")
                .customFont(size: 9, weight: .regular)
                .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                .frame(width: 231)
            HStack {
                Image("detailStar")
                Text("3.9")
                    .customFont(size: 9, weight: .semibold)
                    .foregroundColor(.black)
                Text("(4000 reviews)")
                    .customFont(size: 9, weight: .regular)
                    .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
            }
            
        }
    }
}

struct DetailText_Previews: PreviewProvider {
    static var previews: some View {
        DetailText()
    }
}
