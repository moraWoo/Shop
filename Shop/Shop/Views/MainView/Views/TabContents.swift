import SwiftUI

struct Tab1View: View {
    
    var viewModel: MainViewModel
    let navigationManager: NavigationManager
    
    let items: [[Any]]
    let title = [
        "Latest", "Flash Sale", "Brands"
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<items.count) { row in
                    rowContentContainer(row: row)
                }
            }.padding(.bottom, 87)
        }
    }
    
    init(viewModel: MainViewModel, items: [[Any]], navigationManager: NavigationManager) {
        self.viewModel = viewModel
        self.items = items
        self.navigationManager = navigationManager
    }
    
    private func rowContentContainer(row: Int) -> some View {
        VStack(alignment: .trailing) {
            rowTitle(row: row)
            rowContent(row: row)
        }
    }
    
    private func rowTitle(row: Int) -> some View {
        HStack(alignment: .bottomText) {
            Text(title[row])
                .customFont(size: 15, weight: .medium)
                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                .alignmentGuide(.bottomText) { d in d[.bottom] }
            Spacer()
            Button(action: {}) {
                Text("View all")
                    .customFont(size: 9, weight: .medium)
                    .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                    .alignmentGuide(.bottomText) { d in d[.bottom]
                    }
            }
        }
        .padding(.horizontal, 11)
    }
    
    private func rowContent(row: Int) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                rowItems(row: row)
            }
            .padding(.horizontal, 11)
        }
    }
    
    private func rowItems(row: Int) -> some View {
        ForEach(items[row].indices, id: \.self) { index in
            let item = items[row][index]
            ItemRowComponent(item: item, navigationManager: navigationManager, viewModel: viewModel, row: row)
        }
    }
}


struct Tab2View: View {
    var body: some View {
        Text("Tab 2 Content")
    }
}

struct Tab3View: View {
    var body: some View {
        Text("Tab 3 Content")
    }
}

struct Tab4View: View {
    var body: some View {
        Text("Tab 4 Content")
    }
}

struct Tab5View: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        Button(action: {
            viewModel.showPersonInfoView?.wrappedValue = true
        }) {
            Text("Show Person Info")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

struct ItemRowComponent: View {
    
    @State private var showDetailView: Bool = false

    let item: Any
    let navigationManager: NavigationManager
    let viewModel: MainViewModel
    let row: Int
    
    var body: some View {
        itemCardView()
    }
    
    private func itemCardView() -> some View {
        if let latestProduct = item as? LatestProduct {
            return AnyView(ItemCardView(showDetailView: $showDetailView, item: latestProduct, row: row)
                .environmentObject(navigationManager)
                .environmentObject(viewModel))
        } else if let flashSaleProduct = item as? FlashSaleProduct {
            return AnyView(ItemCardView(showDetailView: $showDetailView, item: flashSaleProduct, row: row)
                .environmentObject(navigationManager)
                .environmentObject(viewModel))
        } else {
            return AnyView(EmptyView())
        }
    }
}
