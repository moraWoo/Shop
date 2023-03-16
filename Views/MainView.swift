//
//  MainView.swift
//  Views
//
//  Created by Ильдар on 17.03.2023.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    let items = [
        ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10", "Item 11", "Item 12", "Item 13", "Item 14", "Item 15"],
        ["Item 16", "Item 17", "Item 18", "Item 19", "Item 20", "Item 21", "Item 22", "Item 23", "Item 24", "Item 25", "Item 26", "Item 27", "Item 28", "Item 29", "Item 30"],
        ["Item 31", "Item 32", "Item 33", "Item 34", "Item 35", "Item 36", "Item 37", "Item 38", "Item 39", "Item 40", "Item 41", "Item 42", "Item 43", "Item 44", "Item 45"]
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // 1. HStack с кнопками меню и фото пользователя
                HStack {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "person.crop.circle")
                    }
                }
                .padding(.horizontal)
                
                // 2. SearchBar
                TextField("Search...", text: .constant(""))
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // 3. HStack с круглыми кнопками
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<6) { index in
                            VStack {
                                Button(action: {}) {
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 60, height: 60)
                                }
                                Text("Label \(index + 1)")
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                    .padding(.top, 16)
                }
                
                TabView {
                    
                    ScrollView {
                        
                        
                        VStack {
                            ForEach(0..<items.count) { row in
                                VStack(alignment: .trailing) {
                                    HStack {
                                        Text("Row \(row + 1)")
                                            .font(.title)
                                            .bold()
                                        Spacer()
                                        Button(action: {}) {
                                            Text("View all")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            ForEach(items[row], id: \.self) { item in
                                                ZStack(alignment: .bottomTrailing) {
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .fill(Color.gray)
                                                        .frame(width: row == 1 ? 174 : 114, height: row == 1 ? 221 : 149)
                                                    
                                                    Text(item)
                                                        .foregroundColor(.white)
                                                    
                                                    VStack {
                                                        Spacer()
                                                        HStack {
                                                            Spacer()
                                                            if row == 0 {
                                                                Button(action: {}) {
                                                                    Image(systemName: "plus")
                                                                        .foregroundColor(.white)
                                                                        .padding(8)
                                                                        .background(Color.blue)
                                                                        .clipShape(Circle())
                                                                }
                                                                .padding(.trailing, 8)
                                                                .padding(.bottom, 8)
                                                            } else if row == 1 {
                                                                HStack(spacing: 4) {
                                                                    Button(action: {}) {
                                                                        Image(systemName: "heart")
                                                                            .foregroundColor(.white)
                                                                            .padding(8)
                                                                            .background(Color.red)
                                                                            .clipShape(Circle())
                                                                    }
                                                                    
                                                                    Button(action: {}) {
                                                                        Image(systemName: "plus")
                                                                            .foregroundColor(.white)
                                                                            .padding(8)
                                                                            .background(Color.blue)
                                                                            .clipShape(Circle())
                                                                    }
                                                                }
                                                                .padding(.trailing, 8)
                                                                .padding(.bottom, 8)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("Tab 1")
                    }
                    
                    Text("Tab 2 Content")
                        .tabItem {
                            Image(systemName: "2.square.fill")
                            Text("Tab 2")
                        }
                    Text("Tab 3 Content")
                        .tabItem {
                            Image(systemName: "3.square.fill")
                            Text("Tab 3")
                        }
                    Text("Tab 4 Content")
                        .tabItem {
                            Image(systemName: "4.square.fill")
                            Text("Tab 4")
                        }
                    Text("Tab 5 Content")
                        .tabItem {
                            Image(systemName: "5.square.fill")
                            Text("Tab 5")
                        }
                }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


