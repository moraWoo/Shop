import Combine
import SwiftUI

struct ItemCardView: View {
  @EnvironmentObject var viewModel: MainViewModel

  @State private var selectedTab = 0
  @State private var uiImage: UIImage?
  @State private var isLoading = true

  @Binding var showDetailView: Bool

  let item: Any
  let row: Int

  private func loadImage() {
    if let latestProduct = item as? LatestProduct, let url = URL(string: latestProduct.imageURL) {
      DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self.uiImage = image
            self.isLoading = false
          }
        }
      }
    } else if let flashSaleProduct = item as? FlashSaleProduct, let url = URL(string: flashSaleProduct.imageURL) {
      DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self.uiImage = image
            self.isLoading = false
          }
        }
      }
    }
  }

  var body: some View {
    Button(action: {
      viewModel.presentDetailView()
    }, label: {
      ZStack(alignment: .bottomTrailing) {
        let width: CGFloat = row == 1 ? 174 : 114
        let height: CGFloat = row == 1 ? 221 : 149
        let placeholder = RoundedRectangle(cornerRadius: 10).fill(Color.gray).opacity(0.1)

        if isLoading {
          ProgressView()
            .frame(width: width, height: height)
        }

        if let uiImage = uiImage {
          Image(uiImage: uiImage)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .cornerRadius(20)
        } else {
          placeholder
            .frame(width: width, height: height)
            .redacted(reason: .placeholder)
            .cornerRadius(20)
        }

        VStack {
          Spacer()
          HStack {
            Spacer()
            if let latestProduct = item as? LatestProduct, row == 0 {
              LatestItem(latestProduct: latestProduct)
            } else if let flashSaleProduct = item as? FlashSaleProduct, row == 1 {
              FlashSaleItem(flashSaleProduct: flashSaleProduct)
            } else if let latestProduct = item as? LatestProduct, row == 2 {
              LatestItem(latestProduct: latestProduct)
            }
          }
        }
      }
    })
    .onAppear(perform: loadImage)
    .onTapGesture {
      viewModel.appCoordinator.dependencies.navigationManager.customTabBar = AnyView(
        CustomTabBar(
          selectedTab: $selectedTab
        )
      )
      viewModel.showDetailView = $showDetailView
    }
  }
}
