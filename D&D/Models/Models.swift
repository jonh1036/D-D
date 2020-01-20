//
//  Models.swift
//  D&D
//
//  Created by Jonathan Silva on 19/01/20.
//  Copyright © 2020  Jonathan Silva. All rights reserved.
//

import Foundation

struct RootStruct: Decodable {
    let index: String
    let name: String
    let url: String
}

struct Classes: Decodable {
    let count: Int
    let results: [RootStruct]
}

struct Races: Decodable {
    let count: Int
    let results: [RootStruct]
}

struct Subraces: Decodable {
    let count: Int
    let results: [RootStruct]
}

struct Skills: Decodable {
    let count: Int
    let results: [RootStruct]
}

struct SpecificRace: Decodable {
    let _id: String
    let index: String
    let name: String
    let speed: Int
    let ability_bonuses: [AbilityBonuses]
    let alignment: String
    let age: String
    let size: String
    let size_description: String
    let starting_proficiencies: [StartingProficiencies]
    let languages: [BasicStruct]
    let traits: [BasicStruct]
    let subraces: [Subraces]
    let url: String
}

struct AbilityBonuses: Decodable {
    let name: String
    let url: String
    let bonus: Int
}

struct StartingProficiencies: Decodable {
    let url: String
    let name: String
}

struct StartingProficiencyOptions: Decodable {
    let choose: Int
    let type: String
    let from: [StartingProficiencies]
}

struct BasicStruct: Decodable {
    let url: String
    let name: String
}

enum Tendencies {
    case LB
    case NB
    case CB
    case LN
    case N
    case CN
    case LM
    case NM
    case CM
    
    var tendencies: String {
        switch self {
        case .LB:
            return "Leal e Bom"
        case .NB:
            return "Neutro e Bom"
        case .CB:
            return "Caótico e Bom"
        case .LN:
            return "Leal e Neutro"
        case .N:
            return "Neutro"
        case .CN:
            return "Caótico e Neutro"
        case .LM:
            return "Leal e Mau"
        case .NM:
            return "Neutro e Mau"
        case .CM:
            return "Caótico e Mau"
        }
    }
}
