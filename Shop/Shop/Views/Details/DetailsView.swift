//
//  DetailsView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        Text("DetailsView")
        
        Button("Back") {
            coordinator.back()
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
