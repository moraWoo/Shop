import SwiftUI

struct MainImage: View {
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("detailImage")
                .resizable()
                .frame(width: 328, height: 279)
                .clipShape(RoundedCornersShape(corners: [.topRight, .bottomRight], radius: 9))

            VStack(alignment: .trailing) {
                ZStack {
                    Rectangle()
                        .frame(width: 42, height: 84)
                        .foregroundColor(Color(red: 229/255, green: 233/255, blue: 239/255))
                        .cornerRadius(9)

                    VStack {
                        Button(action: {
                            // Действие при нажатии на кнопку
                        }, label: {
                            Image("heartButton")
                                .background(Color.clear)
                        })
                        .buttonStyle(PlainButtonStyle())

                        Rectangle()
                            .frame(width: 12, height: 1)
                            .background(Color(red: 84/255, green: 85/255, blue: 137/255))

                        Button(action: {
                            // Действие при нажатии на кнопку
                        }, label: {
                            Image("shareButton")
                                .background(Color.clear)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.trailing, 40)
                .alignmentGuide(.trailing, computeValue: { dimension in
                    dimension[HorizontalAlignment.trailing] - 130 / 2
                })
            }.padding(.bottom, 30)
        }
    }
}
