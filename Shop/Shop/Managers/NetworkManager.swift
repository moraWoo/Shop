import Combine
import Foundation

class NetworkManager: ObservableObject {
  func fetchLatestAndFlashSale() -> AnyPublisher<(LatestProductsResponse, FlashSaleResponse), Error> {
    guard let latestProductsURL = latestProductsURL, let flashSaleURL = flashSaleURL else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }
    let latestPublisher = URLSession.shared.dataTaskPublisher(for: latestProductsURL)
      .map(\.data)
      .decode(type: LatestProductsResponse.self, decoder: JSONDecoder())
    let flashSalePublisher = URLSession.shared.dataTaskPublisher(for: flashSaleURL)
      .map(\.data)
      .decode(type: FlashSaleResponse.self, decoder: JSONDecoder())
    return Publishers.Zip(latestPublisher, flashSalePublisher)
      .eraseToAnyPublisher()
  }

  func fetchProducts() -> AnyPublisher<[ProductDetails], Error> {
    guard let productsURL = productsURL else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: productsURL)
      .map(\.data)
      .decode(type: [ProductDetails].self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}
