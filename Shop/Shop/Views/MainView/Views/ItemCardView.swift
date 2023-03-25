import SwiftUI

struct ItemCardView: View {
    let item: Any
    let row: Int

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            let width: CGFloat = row == 1 ? 174 : 114
            let height: CGFloat = row == 1 ? 221 : 149
            let placeholder = RoundedRectangle(cornerRadius: 10).fill(Color.gray).opacity(0.1)

            Image("appleLogo")
                .resizable()
                .frame(width: width, height: height)

            Text("qqq")
                .foregroundColor(.white)
                .padding()

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
