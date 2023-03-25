import Foundation

struct FlashSaleProduct: Codable, Identifiable {
    
    let id = UUID()
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        
        case category
        case name
        case price
        case discount
        case imageURL = "image_url"
    }
}

struct FlashSaleResponse: Codable {
    
    let flashSale: [FlashSaleProduct]
    
    enum CodingKeys: String, CodingKey {
        
        case flashSale = "flash_sale"
    }
}
