//
//  PickerLocation.swift
//  Views
//
//  Created by Ильдар on 18.03.2023.
//

import SwiftUI

//struct PickerLocation: View {
//    @State private var showDropdown = false
//    @State private var selectedLocation = "Location"
//    let locations = ["Нью-Йорк", "Лос-Анджелес", "Сан-Франциско", "Москва", "Сидней"]
//
//    var body: some View {
//        ZStack(alignment: .top) {
//            VStack {
//                Button(action: {
//                    showDropdown.toggle()
//                }) {
//                    HStack {
//                        Text(selectedLocation)
//                            .customFont(size: 10, weight: .regular)
//                            .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
//                        Image(systemName: "chevron.down")
//                            .resizable()
//                            .frame(width: 6, height: 4)
//                            .foregroundColor(.black)
//                    }
//                }
//                Spacer()
//            }
//
//            if showDropdown {
//                Color.white
//                    .frame(width: 100, height: 150)
//                    .overlay(
//                        VStack(spacing: 0) {
//                            ForEach(locations, id: \.self) { location in
//                                Button(action: {
//                                    selectedLocation = location
//                                    showDropdown = false
//                                }) {
//                                    Text(location)
//                                        .foregroundColor(.black)
//                                }
//                            }
//                        }
//                        .frame(maxWidth: .infinity)
//                    )
//                    .border(Color.gray, width: 1)
//                    .position(x: 50, y: 220)
//            }
//        }
//    }
//}

//struct PickerLocation: View {
//    let locations = ["Нью-Йорк", "Лос-Анджелес", "Сан-Франциско", "Москва", "Сидней"]
//    @State private var selectedLocation = "Location"
//
//    var body: some View {
//        VStack {
//            Picker("", selection: $selectedLocation) {
//                ForEach(locations, id: \.self) { location in
//                    Text(location)
//                }
//            }
//            .pickerStyle(MenuPickerStyle())
//            .font(.custom("Montserrat", size: 10))
//            .fontWeight(.regular)
//            .accentColor(.blue) // изменение цвета шрифта
//        }
//        .padding()
//    }
//}

struct PickerLocation: View {
    @State private var selectedLocation = 0
    let locations = ["Нью-Йорк", "Лос-Анджелес", "Сан-Франциско", "Москва", "Сидней"]
    
    var body: some View {
        VStack {
            Menu {
                ForEach(0 ..< locations.count) { index in
                    Button(action: {
                        selectedLocation = index
                    }) {
                        Text(locations[index])
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(.blue)
                    }
                }
            } label: {
                HStack {
                    Text(locations[selectedLocation])
                        .customFont(size: 10, weight: .regular)
                        .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 6, height: 4)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct PickerLocation_Previews: PreviewProvider {
    static var previews: some View {
        PickerLocation()
    }
}
