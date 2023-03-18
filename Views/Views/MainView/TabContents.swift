//
//  TabContents.swift
//  Views
//
//  Created by Ильдар on 17.03.2023.
//

import SwiftUI

struct Tab1View: View {
    let items: [[String]]
    let title = [
        "Latest", "Flash Sale", "Brands"
    ]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<items.count) { row in
                    VStack(alignment: .trailing) {
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
                            
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(items[row], id: \.self) { item in
                                    ItemCardView(item: item, row: row)
                                }
                            }
                            .padding(.horizontal, 11) // Добавляем отступы слева и справа по 11 для элементов
                        }
                    }
                }
            }
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
