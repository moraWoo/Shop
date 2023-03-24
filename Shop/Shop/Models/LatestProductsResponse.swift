import Foundation

struct LatestProduct: Codable {
    let category: String
    let name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case imageURL = "image_url"
    }
}

struct LatestProductsResponse: Codable {
    let latest: [LatestProduct]
}
