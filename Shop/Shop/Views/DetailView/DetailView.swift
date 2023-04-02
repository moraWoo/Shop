import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        
        ZStack {
            VStack {
                MainImage(viewModel: viewModel)
                    .padding(.bottom, 10)
                    .padding(.top, 30)
                ZoomImagesView()
                    .padding(.bottom, 22)
                DetailText()
                    .padding(.bottom, 11)
                ChooseColor()
                    .padding(.bottom, 20)
                ButtonCartBlock()
            }
            VStack {
                Spacer()
                if let tabBar = viewModel.appCoordinator.dependencies.navigationManager.customTabBar {
                    tabBar
                        .padding(.bottom, -40)
                }
            }
        }
    }
}
