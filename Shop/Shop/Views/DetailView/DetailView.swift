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
                    .padding(.bottom, 10)
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
                if let tabBar = navigationManager.customTabBar {
                    tabBar
                        .padding(.bottom, -10)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    let detailViewCoordinator = DetailCoordinator()
    let networkManager = NetworkManager()
    let navigationManager = NavigationManager()
    
    static var previews: some View {
        let viewModel = DetailViewModel(coordinator: DetailCoordinator(), networkManager: NetworkManager(), navigationManager: NavigationManager())
        let navigationManager = NavigationManager()
        DetailView(viewModel: viewModel, navigationManager: navigationManager)
    }
}
