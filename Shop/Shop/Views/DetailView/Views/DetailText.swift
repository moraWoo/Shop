import SwiftUI

struct DetailText: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("New balance Sneakers")
                    .customFont(size: 17, weight: .semibold)
                    .foregroundColor(.black)
                Spacer()
                Text("$ 22")
                    .customFont(size: 17, weight: .semibold)
                    .foregroundColor(.black)
            }.padding(.bottom, 11)
            
            Text("Features waterproof, fire, air resistant shoes. all changed when the country of fire attacked")
                .customFont(size: 9, weight: .regular)
                .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                .frame(width: 231)
                .padding(.bottom, 11)
            
            HStack {
                Image("detailStar")
                Text("3.9")
                    .customFont(size: 9, weight: .semibold)
                    .foregroundColor(.black)
                Text("(4000 reviews)")
                    .customFont(size: 9, weight: .regular)
                    .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
            }
            
        }.padding(.leading, 24)
            .padding(.trailing, 24)
    }
}
