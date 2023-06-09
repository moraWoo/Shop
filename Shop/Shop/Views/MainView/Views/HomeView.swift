//
//  HomeView.swift
//  Shop
//
//  Created by Ильдар on 22.03.2023.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel: MainViewModel

  let items = [
    ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"],
    ["Item 16", "Item 17", "Item 18", "Item 19", "Item 20", "Item 21"],
    ["Item 31", "Item 32", "Item 33", "Item 34", "Item 35", "Item 36"]
  ]

  @State private var selectedTab = 0

  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          TopBarView()
          SearchBarView()
          CircleButtonView()
          ItemRowView(items: items, selectedTab: $selectedTab)
        }
        VStack {
          Spacer()
          CustomTabBar(selectedTab: $selectedTab)
            .padding(.bottom, -10)
        }
      }
      .background(Color.clear.edgesIgnoringSafeArea(.all))
      .onChange(of: selectedTab, { value in
        if value == 4 {
          viewModel.personInfo()
        }
      }
    }
  }
}
