import Foundation

struct SpecificRace: Decodable {
    let index: String
    let name: String
    let speed: Int
    let ability_bonuses: [AbilityBonuses]
    let starting_proficiencies: [BasicStruct]
    let starting_proficiency_options: ProficiencyOptions
    let languages: [BasicStruct]
    let traits: [BasicStruct]
    let subraces: [BasicStruct]
    let url: String
}
