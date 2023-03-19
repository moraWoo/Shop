//
//  DetailView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel

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
