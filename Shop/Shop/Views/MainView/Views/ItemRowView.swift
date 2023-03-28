import SwiftUI

struct ItemRowView: View {
    
    @Binding var selectedTab: Int
    
    var viewModel: MainViewModel
    
    let items: [[Any]]
    let navigationManager: NavigationManager

    init(viewModel: MainViewModel, selectedTab: Binding<Int>, items: [[Any]], navigationManager: NavigationManager) {
        self.viewModel = viewModel
        self._selectedTab = selectedTab
        self.items = items
        self.navigationManager = navigationManager
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if selectedTab == 0 {
                Tab1View(viewModel: viewModel, items: items, navigationManager: navigationManager)
            } else if selectedTab == 1 {
                Tab2View()
            } else if selectedTab == 2 {
                Tab3View()
            } else if selectedTab == 3 {
                Tab4View()
            } else if selectedTab == 4 {
                Tab5View()
                    .background(Tab5View().opacity((viewModel.showPersonInfoView != nil) ? 0 : 1))
            }
            Spacer()
        }
    }
}
