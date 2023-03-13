//
//  MainView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            // ... view content
            Button("Details") {
                coordinator.showDetailsView()
            }
            Button("Profile") {
                coordinator.showProfileView()
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
