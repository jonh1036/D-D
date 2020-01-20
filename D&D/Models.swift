//
//  Models.swift
//  D&D
//
//  Created by Jonathan Silva on 19/01/20.
//  Copyright © 2020  Jonathan Silva. All rights reserved.
//

import Foundation

struct Classes: Decodable {
    let count: Int
    let results: [RootStruct]
}

//struct RootStruct: Decodable {
//    let index: String
//    let name: String
//    let url: String
//}

struct RootStruct: Decodable {
    let index: String
    let name: String
    let url: String
}

struct Races: Decodable {
    let count: Int
    let results: [RootStruct]
}
