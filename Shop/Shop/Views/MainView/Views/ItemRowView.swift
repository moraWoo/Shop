import SwiftUI

struct ItemRowView: View {
    
    @Binding var selectedTab: Int
    
    let items: [[Any]]

    var body: some View {
        VStack(spacing: 0) {
            if selectedTab == 0 {
                Tab1View(items: items)
            } else if selectedTab == 1 {
                Tab2View()
            } else if selectedTab == 2 {
                Tab3View()
            } else if selectedTab == 3 {
                Tab4View()
            } else if selectedTab == 4 {
                Tab5View()
            }
            
            Spacer()
        }
    }
}
