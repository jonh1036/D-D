//
//  EspacosMagia.swift
//  D&D
//
//  Created by carlos amorim on 22/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct EspacosMagia:Decodable{
    var spells_known:Int?
    var cantrips_known:Int?
    var spell_slots_level_1:Int
    var spell_slots_level_2:Int
    var spell_slots_level_3:Int
    var spell_slots_level_4:Int
    var spell_slots_level_5:Int
}
