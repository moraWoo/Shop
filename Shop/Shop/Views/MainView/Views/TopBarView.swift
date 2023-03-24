import SwiftUI
import Combine

struct TopBarView: View {
    @Binding var profileImage: UIImage?
    var viewModel: MainViewModel
    
    init(viewModel: MainViewModel, profileImage: Binding<UIImage?>) {
        self.viewModel = viewModel
        self._profileImage = profileImage
    }
    
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
            VStack() {
                if let uiImage = profileImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                } else {
                    Image("person")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                }
                PickerLocation()
            }
        }
        .padding(.horizontal)
    }
}
