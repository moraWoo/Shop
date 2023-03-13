//
//  SingInView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct SingInView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @StateObject var viewModel = SingInViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView()
    }
}
