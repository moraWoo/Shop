//
//  ProfileView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        Text("ProfileView")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
