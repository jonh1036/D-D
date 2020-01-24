//
//  MySearch.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 23/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import Foundation

class MySearch {
    static func search(attribute: Attribute, in attributes: [Attribute]) -> Int? {
        for (index, value) in attributes.enumerated() {
            if value.name == attribute.name {
                return index
            }
        }
        return nil
    }
}
