import SwiftUI

struct PersonInfoView: View {
    
    @ObservedObject var viewModel: PersonInfoViewModel
    
    var body: some View {
        
        ZStack {
            VStack() {
                SettingsList(viewModel: viewModel)
            }
            VStack {
                Spacer()
//                if let tabBar = navigationManager.customTabBar {
//                    tabBar
//                        .padding(.bottom, -40)
//                }
            }
        }
    }
}
