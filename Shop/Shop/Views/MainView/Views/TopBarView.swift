import SwiftUI

struct TopBarView: View {
    @Binding var profileImage: UIImage?

    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
            }
            Spacer()
            Text("Trade by ")
                .customFont(size: 20, weight: .bold)
                .foregroundColor(Color.black) + Text("bata")
                .customFont(size: 20, weight: .bold)
                .foregroundColor(Color(red: 78/255, green: 85/255, blue: 215/255))
            Spacer()
            VStack(){
                Button(action: {}) {
                    Image("person")
                }
                PickerLocation()
            }
        }
        .padding(.horizontal)
    }
}
