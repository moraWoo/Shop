import SwiftUI

struct TopView: View {
    
    @ObservedObject var viewModel: PersonInfoViewModel
    @State private var showImagePicker = false
    @Binding var profileImage: UIImage?
    
    var body: some View {
        
        VStack {
            Text("Profile")
                .customFont(size: 15, weight: .bold)
                .padding(.top, 19)
            if let uiImage = profileImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 60, height: 60).clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .clipShape(Circle())
            } else {
                Image("person")
                    .resizable()
                    .frame(width: 60, height: 60).clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
            }
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("Change photo")
                    .customFont(size: 8, weight: .medium)
                    .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                    .padding(.bottom, 10)
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(
                    viewModel: viewModel, image: $profileImage,
                    firstName: viewModel.firstName ?? "Name haven't loaded",
                    onFinishPicking: { image in
                        viewModel.updateAvatar(image: image)
                    }
                )
            }

            Text(viewModel.userRepository.currentUser?.firstName ?? "Not Loaded Name")
                .customFont(size: 15, weight: .bold)
                .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                .padding(.bottom, 36)

            ZStack(alignment: .leading) {
                Button {
                    print("Login...")
                } label: {
                    Text("Upload Item")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.bottom, 10)
                
                Image("share")
                    .frame(height: 15.0, alignment: Alignment.leading)
                    .padding(.leading, 50)
                Spacer()
            }
            .padding(.leading, 43)
            .padding(.trailing, 43)
        }
    }
}

