import SwiftUI

struct ColorPickerView: View {
    @State private var selectedColor: Int = 0
    
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
