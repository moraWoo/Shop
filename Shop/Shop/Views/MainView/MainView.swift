import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TopBarView(viewModel: viewModel, profileImage: $viewModel.profileImage)
                    SearchBarView()
                    CircleButtonView()
                    ItemRowView(selectedTab: $selectedTab, items: viewModel.items)
                }
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                        .padding(.bottom, -10)
                }
            }
            .background(Color.clear.edgesIgnoringSafeArea(.all))
            .onChange(of: selectedTab, perform: { value in
                if value == 4 {
                    viewModel.personInfo()
                }
            })
            .onAppear {
                self.viewModel.fetchLatestAndFlashSaleProducts()
            }
        }
    }
}
