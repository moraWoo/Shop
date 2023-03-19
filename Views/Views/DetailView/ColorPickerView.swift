//
//  ColorPickerView.swift
//  Views
//
//  Created by Ильдар on 18.03.2023.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var selectedColor: Int = 0 // Set initial selected color to the first one
    
    let colors: [Color] = [.white, .gray, .black]
    
    var body: some View {
        HStack {
            ForEach(0..<colors.count, id: \.self) { index in
                let color = colors[index]
                let isSelected = (selectedColor == index)
                color
                    .frame(width: 34, height: 26)
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                    .overlay(
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(index == 0 ? (Color(red: 173/255, green: 173/255, blue: 173/255)) : (isSelected ? Color.gray : Color.white), lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedColor = index
                    }
            }
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
