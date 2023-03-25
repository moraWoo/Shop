import SwiftUI

struct FlashSaleItem: View {
    
    let flashSaleProduct: FlashSaleProduct
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Image("forBigItems")
                    .resizable()
                    .background(Color(red: 229/255, green: 233/255, blue: 239/255))
                    .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                    .clipShape(Circle())
                    .frame(width: 25, height: 25)
                Spacer()
                Rectangle()
                    .fill(Color(red: 196/255, green: 196/255, blue: 196/255))
                    .frame(width: 50, height: 17)
                    .cornerRadius(8)
                    .overlay(
                        Text(flashSaleProduct.category)
                            .foregroundColor(Color(red: 7/255, green: 6/255, blue: 4/255))
                            .customFont(size: 9, weight: .semibold)
                    )
                VStack(alignment: .leading) {
                    Text(flashSaleProduct.name)
                        .customFont(size: 16, weight: .semibold)
                        .foregroundColor(.white)
                        .frame(width: 80)
                        .padding(.bottom, 10)
                    Text("$ \(flashSaleProduct.price)")
                        .customFont(size: 13, weight: .semibold)
                        .foregroundColor(.white)
                }
            }.padding(.leading, 8)
                .padding(.bottom, 12)
                .padding(.top, 8)
            
            VStack(alignment: .trailing) {
                Rectangle()
                    .fill(Color(.red))
                    .frame(width: 50, height: 18)
                    .cornerRadius(8)
                    .overlay(
                        Text("30$ off")
                            .foregroundColor(Color(.white))
                            .customFont(size: 10, weight: .semibold)
                    )
                Spacer()
                HStack {
                    Button(action: {}) {
                        Image(systemName: "heart")
                            .resizable()
                            .padding(8)
                            .background(Color(red: 229/255, green: 233/255, blue: 239/255))
                            .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                            .clipShape(Circle())
                            .frame(width: 28, height: 28)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .resizable()
                            .padding(8)
                            .background(Color(red: 229/255, green: 233/255, blue: 239/255))
                            .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                            .clipShape(Circle())
                            .frame(width: 35, height: 35)
                    }
                }
            }.padding(.trailing, 8)
                .padding(.bottom, 8)
                .padding(.top, 8)
        }
    }
}
