import SwiftUI
import Combine

struct ItemCardView: View {
    let item: Any
    let row: Int
    @State private var uiImage: UIImage? = nil

    private func loadImage() {
        if let latestProduct = item as? LatestProduct, let url = URL(string: latestProduct.imageURL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.uiImage = image
                    }
                }
            }
        } else if let flashSaleProduct = item as? FlashSaleProduct, let url = URL(string: flashSaleProduct.imageURL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.uiImage = image
                    }
                }
            }
        }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            let width: CGFloat = row == 1 ? 174 : 114
            let height: CGFloat = row == 1 ? 221 : 149
            let placeholder = RoundedRectangle(cornerRadius: 10).fill(Color.gray).opacity(0.1)

            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: width, height: height)
            } else {
                placeholder.frame(width: width, height: height)
            }

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
        .onAppear(perform: loadImage)
    }
}





