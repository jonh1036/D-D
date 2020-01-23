//
//  ChangeValueDelegate.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 23/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import Foundation


protocol ChangeValueDelegate: class {
    func changeValue(for newValue: Attribute)
    func endEditing()
}
