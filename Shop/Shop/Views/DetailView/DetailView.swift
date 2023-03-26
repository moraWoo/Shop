import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        VStack {
            MainImage()
            ZoomImagesView()
            DetailText()
            ChooseColor()
            Spacer()
        }
    }
}
