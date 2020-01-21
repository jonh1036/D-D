import Foundation

struct APIClasses: Decodable {
    let count: Int
    let results: [RootStruct]
}
