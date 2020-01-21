import Foundation

struct ProficiencyOptions: Decodable {
    let choose: Int
    let type: String
    let from: [BasicStruct]
}
