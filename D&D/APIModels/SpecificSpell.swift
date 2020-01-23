import Foundation

struct SpecificSpell: Decodable {
    let index: String
    let name: String
    let desc: [String]
    let higher_level: [String]?
    let range: String
    let components: [String]
    let ritual: Bool
    let duration: String
    let concentration: Bool
    let casting_time: String
    let school: BasicStruct
    let classes: [BasicStruct]
    let subclasses: [BasicStruct]
    let url: String
}
