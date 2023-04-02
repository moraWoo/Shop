import Foundation
import Combine

protocol NetworkManagerProtocol: AnyObject {
    func fetchLatestAndFlashSale() -> AnyPublisher<(LatestProductsResponse, FlashSaleResponse), Error>
    func fetchProducts() -> AnyPublisher<[ProductDetails], Error>
}
