//
//  MainImage.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import SwiftUI

struct MainImage: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("detailImage")
                .resizable()
                .frame(width: 328, height: 279)
                .padding(.trailing, 0)
                .clipShape(RoundedCornersShape(corners: [.topRight, .bottomRight], radius: 9))
            Spacer()
        }
    }
}

struct MainImage_Previews: PreviewProvider {
    static var previews: some View {
        MainImage()
    }
}
