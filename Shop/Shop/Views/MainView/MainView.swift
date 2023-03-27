import SwiftUI

struct MainView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @ObservedObject var viewModel: MainViewModel
    @State private var selectedTab = 0
    @State private var hideMainComponents = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if !hideMainComponents {
                    VStack {
                        TopBarView(viewModel: viewModel, profileImage: $viewModel.profileImage)
                        SearchBarView()
                        CircleButtonView()
                        ItemRowView(viewModel: viewModel, selectedTab: $selectedTab, items: viewModel.items, navigationManager: viewModel.navigationManager)
                    }
                }
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                        .padding(.bottom, -10)
                }
                if let currentView = viewModel.navigationManager.currentView {
                    currentView
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .background(Color.clear.edgesIgnoringSafeArea(.all))
            .onChange(of: selectedTab, perform: { value in
                if value == 4 {
                    viewModel.personInfo()
                    hideMainComponents = true
                } else {
                    hideMainComponents = false
                }
            })
            .onAppear {
                self.viewModel.fetchLatestAndFlashSaleProducts()
                viewModel.navigationManager.customTabBar = AnyView(CustomTabBar(selectedTab: $selectedTab))
            }
        }
    }
}
