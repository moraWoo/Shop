import SwiftUI

struct Tab1View: View {
    
    let items: [[Any]]
    let title = [
        "Latest", "Flash Sale", "Brands"
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<items.count) { row in
                    VStack(alignment: .trailing) {
                        rowTitle(row: row)
                        rowContent(row: row)
                    }
                }
            }.padding(.bottom, 87)
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
                ForEach(0..<items[row].count, id: \.self) { index in
                    let item = items[row][index]
                    if let latestProduct = item as? LatestProduct {
                        ItemCardView(item: latestProduct, row: row) // передайте весь объект latestProduct
                    } else if let flashSaleProduct = item as? FlashSaleProduct {
                        ItemCardView(item: flashSaleProduct, row: row) // передайте весь объект flashSaleProduct
                    }
                }
            }
            .padding(.horizontal, 11)
        }
    }
}

// Tab 2 Content
struct Tab2View: View {
    var body: some View {
        Text("Tab 2 Content")
    }
}

// Tab 3 Content
struct Tab3View: View {
    var body: some View {
        Text("Tab 3 Content")
    }
}

// Tab 4 Content
struct Tab4View: View {
    var body: some View {
        Text("Tab 4 Content")
    }
}

// Tab 5 Content
struct Tab5View: View {
    var body: some View {
        Text("Tab 5 Content")
    }
}
