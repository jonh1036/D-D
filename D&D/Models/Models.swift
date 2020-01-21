import Foundation

struct SpecificRace: Decodable {
    let index: String
    let name: String
    let speed: Int
    let ability_bonuses: [AbilityBonuses]
    let starting_proficiencies: [Proficiencies]
    let languages: [BasicStruct]
    let traits: [BasicStruct]
    let subraces: [Race]
    let url: String
}

struct BasicStruct: Decodable {
    let url: String
    let name: String
}

struct BasicStructAux: Decodable {
    let name: String
    let url: String
}

struct Aux: Decodable {
    let url: String
    let classe: String
}
