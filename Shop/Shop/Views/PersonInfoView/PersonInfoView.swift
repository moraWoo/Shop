//
//  PersonInfoView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct PersonInfoView: View {
    @ObservedObject var viewModel: PersonInfoViewModel

    var body: some View {
        VStack() {
            SettingsList()
        }
    }
}
