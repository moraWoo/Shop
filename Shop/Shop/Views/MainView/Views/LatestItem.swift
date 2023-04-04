import SwiftUI

struct LatestItem: View {
  let latestProduct: LatestProduct

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Image("forMiniItems")
          .resizable()
          .background(Color(red: 229 / 255, green: 233 / 255, blue: 239 / 255))
          .foregroundColor(Color(red: 84 / 255, green: 85 / 255, blue: 137 / 255))
          .clipShape(Circle())
          .frame(width: 20, height: 20)
        Spacer()
        Rectangle()
          .fill(Color(red: 196 / 255, green: 196 / 255, blue: 196 / 255))
          .frame(width: 35, height: 12)
          .cornerRadius(5)
          .overlay(
            Text(latestProduct.category)
              .foregroundColor(Color(red: 7 / 255, green: 6 / 255, blue: 4 / 255))
              .customFont(size: 6, weight: .semibold)
          )
        Text(latestProduct.name)
          .customFont(size: 9, weight: .semibold)
          .foregroundColor(.white)
          .frame(height: 26)
        Text("$ \(latestProduct.price)")
          .customFont(size: 7, weight: .semibold)
          .foregroundColor(.white)
      }
      Spacer()
    }.padding(.trailing, 10)
    .padding(.bottom, 10)
    .padding(.top, 10)
    .overlay(
      Button(action: {
        //
      }, label: {
        Image(systemName: "plus")
          .resizable()
          .padding(4)
          .background(Color(red: 229 / 255, green: 233 / 255, blue: 239 / 255))
          .foregroundColor(Color(red: 84 / 255, green: 85 / 255, blue: 137 / 255))
          .clipShape(Circle())
          .frame(width: 20, height: 20)
      })
      .padding(.bottom, 10)
      .padding(.trailing, 10),
      alignment: .bottomTrailing)
  }
}
