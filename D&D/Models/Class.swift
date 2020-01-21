import Foundation

struct Class: Decodable {
    let index: String
    let name: String
    let hit_die: Int
    let proficiency_choices: [ProficiencyOptions]
    let proficiencies: [BasicStructAux]
    let saving_throws: [BasicStructAux]
    //let starting_equipment: Aux
    //let class_levels: Aux
    let subclasses: [BasicStruct]
    let url: String
}
