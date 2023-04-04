import SwiftUI

struct ButtonCartBlock: View {
  var body: some View {
    ZStack {
      GeometryReader { geo in
        Rectangle()
          .frame(width: geo.size.width, height: geo.size.height - geo.safeAreaInsets.bottom)
          .background(Color.black)
          .clipShape(TopRoundedRectangle(cornerRadius: 27))
      }

      VStack {
        HStack {
          VStack(alignment: .leading) {
            Text("Ouantity")
              .customFont(size: 9, weight: .medium)
              .foregroundColor(Color(red: 128 / 255, green: 128 / 255, blue: 128 / 255))
              .padding(.bottom, 5)
            HStack {
              Button {
                //
              } label: {
                Text("-")
                  .customFont(size: 10, weight: .semibold)
              }.buttonStyle(MiniButtonStyle(width: 38, height: 22))

              Button {
                //
              } label: {
                Text("+")
              }.buttonStyle(MiniButtonStyle(width: 38, height: 22))
            }
          }.padding(.leading, 24)
          Spacer()
          Button {
            //
          } label: {
            HStack {
              Text("#2,500")
                .customFont(size: 8, weight: .semibold)
                .foregroundColor(Color(red: 153 / 255, green: 160 / 255, blue: 255 / 255))
              Spacer()
              Text("ADD TO CART")
                .customFont(size: 8, weight: .semibold)
                .foregroundColor(.white)
            }.padding(.leading, 10)
            .padding(.trailing, 10)
          }
          .buttonStyle(PrimaryButtonStyle())
          .frame(width: 170, height: 44)
          .padding(.trailing, 33)
        }
      }
      .padding(.top, -60)
    }
  }
}
