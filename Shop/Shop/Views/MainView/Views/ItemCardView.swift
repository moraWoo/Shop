//
//  ItemCardView.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import SwiftUI

struct ItemCardView: View {
    let item: String
    let row: Int

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 10)
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
