import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    @State private var items: [[String]] = [[], [], []]
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TopBarView(viewModel: viewModel, profileImage: $viewModel.profileImage)
                    SearchBarView()
                    CircleButtonView()
                    ItemRowView(items: items, selectedTab: $selectedTab)
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
                self.items = viewModel.mainViewItems.map { $0.compactMap { $0 as? String } }
            }
        }
    }
}
