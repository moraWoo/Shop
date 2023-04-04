import SwiftUI

struct ZoomImagesView: View {
  @State private var selectedImage: Int? = 1

  let images = ["miniImage1", "miniImage2", "miniImage3"]

  var body: some View {
    HStack(alignment: .bottom) {
      ForEach(0..<images.count, id: \.self) { index in
        let imageName = images[index]
        let isSelected = (selectedImage == index)
        Image(imageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: isSelected ? 83 : 66, height: isSelected ? 45 : 38)
          .padding(.top, isSelected ? (45 - 38) : 0)
          .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.white))
          .onTapGesture {
            selectedImage = index
          }
      }
    }
  }
}
