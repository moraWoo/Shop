import SwiftUI

struct LatestItem: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image("forMiniItems")
                    .resizable()
                    .background(Color(red: 229/255, green: 233/255, blue: 239/255))
                    .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                    .clipShape(Circle())
                    .frame(width: 20, height: 20)
                Spacer()
                Rectangle()
                    .fill(Color(red: 196/255, green: 196/255, blue: 196/255))
                    .frame(width: 35, height: 12)
                    .cornerRadius(5)
                    .overlay(
                        Text("Phones")
                            .foregroundColor(Color(red: 7/255, green: 6/255, blue: 4/255))
                            .customFont(size: 6, weight: .semibold)
                    )
                Text("Text 1")
                    .customFont(size: 9, weight: .semibold)
                    .foregroundColor(.white)
                Text("Text 2")
                    .customFont(size: 7, weight: .semibold)
                    .foregroundColor(.white)
            }
            Spacer()
        }.padding(.trailing, 10)
            .padding(.bottom, 10)
            .padding(.top, 10)
            .overlay(
                Button(action: {}) {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(4)
                        .background(Color(red: 229/255, green: 233/255, blue: 239/255))
                        .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                        .clipShape(Circle())
                        .frame(width: 20, height: 20)
                }
                .padding(.bottom, 10)
                .padding(.trailing, 10)
                , alignment: .bottomTrailing)    }
}

struct LatestItem_Previews: PreviewProvider {
    static var previews: some View {
        LatestItem()
    }
}
