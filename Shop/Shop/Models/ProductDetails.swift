import Foundation

struct ProductDetails: Codable {
    
    let name: String
    let description: String
    let rating: Double
    let numberOfReviews: Int
    let price: Double
    let colors: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        
        case name
        case description
        case rating
        case numberOfReviews = "number_of_reviews"
        case price
        case colors
        case imageUrls = "image_urls"
    }
}
