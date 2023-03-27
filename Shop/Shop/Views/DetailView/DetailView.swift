import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    @ObservedObject var navigationManager: NavigationManager
    
    init(viewModel: DetailViewModel, navigationManager: NavigationManager) {
        self.viewModel = viewModel
        self.navigationManager = navigationManager
    }
    
    var body: some View {
        ZStack {
            VStack {
                MainImage()
                ZoomImagesView()
                DetailText()
                ChooseColor()
                Spacer()
            }
            VStack {
                Spacer()
                if let tabBar = navigationManager.customTabBar {
                    tabBar
                        .padding(.bottom, -10)
                }
            }
        }
    }
}
