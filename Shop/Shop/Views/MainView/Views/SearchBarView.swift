import SwiftUI

struct SearchBarView: View {
  @State private var searchText = ""

  var body: some View {
    ZStack(alignment: .trailing) {
      TextField("What are you looking for ?", text: $searchText)
        .modifier(TextFieldInputDataModifier())
        .foregroundColor(Color(red: 91 / 255, green: 91 / 255, blue: 91 / 255))
      Button(action: {
        //
      }, label: {
        Image(systemName: "magnifyingglass")
          .resizable()
          .scaledToFit()
          .accentColor(Color(red: 91 / 255, green: 91 / 255, blue: 91 / 255))
          .frame(height: 12.0, alignment: Alignment.trailing)
          .contentShape(Rectangle())
      }).padding(.trailing, 10)
    }.padding(.leading, 43)
    .padding(.trailing, 43)
  }
}
