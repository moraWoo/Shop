import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    private let tabBarItems = [
        "homeT",
        "heartT",
        "cartT",
        "chatT",
        "personT"
    ]

    var body: some View {
        HStack() {
            ForEach(0..<tabBarItems.count) { index in
                Button(action: {
                    selectedTab = index
                }) {
                    if selectedTab == index {
                        VStack() {
                            let circle = Circle()
                                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .frame(width: 50, height: 50)
                            
                            let image = Image(tabBarItems[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(selectedTab == index ? .gray : .black)
                            circle.overlay(image)
                        }
                    } else {
                        Image(tabBarItems[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                }.frame(maxWidth: .infinity)

            }
        }
        .padding(.vertical, 8)
        .frame(height: 87)
        .background(Color.white)
        .background(.clear)
        .clipShape(RoundedRectangle(cornerRadius: 27, style: .continuous))
        .edgesIgnoringSafeArea(.bottom)
    }
}

