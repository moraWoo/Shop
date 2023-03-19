//
//  DetailView.swift
//  Views
//
//  Created by Ильдар on 18.03.2023.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            MainImage()
            ZoomImagesView()
            DetailText()
            ChooseColor()
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
