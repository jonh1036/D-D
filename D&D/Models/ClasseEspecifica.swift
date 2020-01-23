//
//  ClasseEspecifica.swift
//  D&D
//
//  Created by carlos amorim on 22/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import Foundation


struct ClasseEspecifica:Decodable{
    var features:[BasicStruct]
    var prof_bonus:Int
    var feature_choices:[BasicStruct]?
    var spellcasting:EspacosMagia?
}
