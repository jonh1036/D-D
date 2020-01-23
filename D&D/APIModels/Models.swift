import Foundation

struct BasicStruct: Decodable {
    let url: String
    let name: String
}

struct Aux: Decodable {
    let url: String
    let classe: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case classe = "class"
    }
}
