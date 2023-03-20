//
//  SettingsList.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import SwiftUI

struct SettingsList: View {
    let labels = [
        "Trade store", "Payment method", "Balance", "Trade history", "Restore Purchase", "Help", "Log out"
    ]
    let pics = [
        "creditCardS", "restorePurchaseS", "helpS", "logOutS"
    ]
    
    var uniquePics: [String] {
        var unique = Array(repeating: pics[0], count: 4)
        unique.append(contentsOf: pics[1...])
        return unique
    }
    
    func createRow(label: String, pic: String, showChevron: Bool) -> some View {
        HStack {
            let circle = Circle()
                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                .frame(height: 40)
            
            let image = Image(pic)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 20, height: 20)
                .clipShape(Rectangle())
            
            circle.overlay(image)
            
            VStack(alignment: .leading) {
                Text(label)
                    .customFont(size: 14, weight: .medium)
                    .foregroundColor(.black)
            }
            Spacer()
            if showChevron {
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
        }
    }
    
    @ViewBuilder
    func settingsRow(label: String, pic: String) -> some View {
        if label == "Balance" {
            HStack {
                createRow(label: label, pic: pic, showChevron: false)
                Text("$1593")
                    .customFont(size: 14, weight: .medium)
                    .foregroundColor(.black)
            }
        } else if label == "Help" || label == "Log out" {
            Button(action: {
                // Handle button tap
            }) {
                createRow(label: label, pic: pic, showChevron: false)
            }
        } else {
            NavigationLink(destination: Text("Destination: \(label)")) {
                createRow(label: label, pic: pic, showChevron: true)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                TopView()
                
                VStack(alignment: .leading) {
                    ForEach(Array(zip(labels, uniquePics)), id: \.0) { label, pic in
                        settingsRow(label: label, pic: pic)
                            .padding(.vertical, 5)
                    }
                }
                .padding(.leading, 32)
                .padding(.trailing, 32)
            }
            .background(Color.white)
        }
        .accentColor(.black) // Set the accent color to black
    }
}
