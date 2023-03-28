import SwiftUI

struct PersonInfoView: View {
    
    @ObservedObject var viewModel: PersonInfoViewModel
    @ObservedObject var navigationManager: NavigationManager
    
    init(viewModel: PersonInfoViewModel, navigationManager: NavigationManager) {
        self.viewModel = viewModel
        self.navigationManager = navigationManager
    }
    
    var body: some View {
        
        ZStack {
            VStack() {
                SettingsList(viewModel: viewModel)
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
