import SwiftUI

struct ChooseColor: View {
  var body: some View {
    VStack {
      HStack {
        Text("Color:")
          .customFont(size: 10, weight: .semibold)
          .foregroundColor(Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255))
        Spacer()
      }.padding(.leading, 24)

      HStack {
        ColorPickerView()
        Spacer()
      }.padding(.leading, 24)
    }
  }
}
