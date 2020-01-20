import Foundation

struct RootStruct: Decodable {
    let index: String
    let name: String
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
