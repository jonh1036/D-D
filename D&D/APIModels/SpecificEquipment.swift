import Foundation
 
struct SpecificEquipment: Decodable {
    let index: String
    let name: String
    let equipment_category: String
    let gear_category: String
    let weight: Int
    let url: String
}
