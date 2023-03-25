import SwiftUI

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
