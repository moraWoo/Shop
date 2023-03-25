import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?

    func loadImage(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }

    deinit {
        cancellable?.cancel()
    }
}

struct AsyncImage: View {
    @StateObject private var loader = ImageLoader()
    private let placeholder: RoundedRectangle
    private let url: URL

    init(url: URL, placeholder: RoundedRectangle) {
        self.url = url
        self.placeholder = placeholder
    }

    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                placeholder
            }
        }
        .onAppear {
            loader.loadImage(from: url)
        }
    }
}

struct ItemCardView: View {
    let item: Any
    let row: Int

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            let width: CGFloat = row == 1 ? 174 : 114
            let height: CGFloat = row == 1 ? 221 : 149
            let placeholder = RoundedRectangle(cornerRadius: 10).fill(Color.gray)

            if let latestProduct = item as? LatestProduct, let url = URL(string: latestProduct.imageURL) {
                AsyncImage(url: url, placeholder: placeholder as! RoundedRectangle)
                    .frame(width: width, height: height)
            } else if let flashSaleProduct = item as? FlashSaleProduct, let url = URL(string: flashSaleProduct.imageURL) {
                AsyncImage(url: url, placeholder: placeholder as! RoundedRectangle)
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
    }
}
