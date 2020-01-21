import Foundation

struct Proficiencies: Decodable {
    let url: String
    let name: String
}

struct ProficiencyOptions: Decodable {
    let choose: Int
    let type: String
    let from: [Proficiencies]
}
