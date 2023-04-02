import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @State private var selectedTab = 0
    @State private var hideMainComponents = false
    @State private var showPersonInfoView: Bool = false
    @State private var showDetailView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                switch selectedTab {
                    case 0:
                        VStack {
                            TopBarView(viewModel: viewModel, profileImage: $viewModel.profileImage)
                            SearchBarView()
                            CircleButtonView()
                            
                            Tab1View(
                                viewModel: viewModel,
                                items: viewModel.items,
                                navigationManager: viewModel.appCoordinator.dependencies.navigationManager
                            )
                        }
                    case 1:
                        VStack {
                            TopBarView(viewModel: viewModel, profileImage: $viewModel.profileImage)
                            SearchBarView()
                            CircleButtonView()
                            Tab2View()
                            Spacer()
                        }
                    case 2:
                        VStack {
                            TopBarView(
                                viewModel: viewModel,
                                profileImage:
                                    $viewModel.profileImage
                            )
                            SearchBarView()
                            CircleButtonView()
                            Tab3View()
                            Spacer()
                        }
                    case 3:
                        VStack {
                            TopBarView(
                                viewModel: viewModel,
                                profileImage: $viewModel.profileImage
                            )
                            SearchBarView()
                            CircleButtonView()
                            Tab4View()
                            Spacer()
                        }
                    case 4:
                        EmptyView()
                    default:
                        EmptyView()
                }
                
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                        .padding(.bottom, -40)
                }
                if let currentView = viewModel.appCoordinator.dependencies.navigationManager.currentView {
                    currentView
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .background(Color.clear.edgesIgnoringSafeArea(.all))
            .onAppear {
                self.viewModel.fetchLatestAndFlashSaleProducts()
                viewModel.appCoordinator.dependencies.navigationManager.customTabBar = AnyView(CustomTabBar(selectedTab: $selectedTab))
                viewModel.showPersonInfoView = $showPersonInfoView
                
            }
            .onChange(of: selectedTab) { newValue in
                if newValue == 4 {
                    viewModel.goToPersonInfoView()
                }
            }
        }
    }
}
