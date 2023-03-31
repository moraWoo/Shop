import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinator
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
                            
                            Tab1View(viewModel: viewModel, items: viewModel.items)
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
                        Text("case 4")
//                        PersonInfoView(
//                            viewModel: PersonInfoViewModel(
//                                coordinator: viewModel.personInfoCoordinator,
//                                loginCoordinator: viewModel.loginCoordinator,
//                                userRepository: viewModel.userRepository,
//                                navigationManager: viewModel.navigationManager
//                            ), navigationManager: viewModel.navigationManager
//                        )
//                        .environmentObject(viewModel.navigationManager
//                        )
                    default:
                        EmptyView()
                }
                
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                        .padding(.bottom, -40)
                }
                if let currentView = viewModel.navigationManager.currentView {
                    currentView
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .background(Color.clear.edgesIgnoringSafeArea(.all))
            .onAppear {
                self.viewModel.fetchLatestAndFlashSaleProducts()
//                viewModel.navigationManager.customTabBar = AnyView(CustomTabBar(selectedTab: $selectedTab))
                viewModel.showPersonInfoView = $showPersonInfoView
                
            }
        }
    }
}
