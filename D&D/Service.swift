//
//  Service.swift
//  D&D
//
//  Created by Jonathan Silva on 19/01/20.
//  Copyright © 2020  Jonathan Silva. All rights reserved.
//

import Foundation

struct Service<T: Decodable> {
    
    func get(withRoute route: Router, completion: @escaping (T?, Error?) -> Void) {
        
        guard let url = URL(string: route.endpoint) else {
            return completion(nil, nil)
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(result, nil)
                }
                
                
           
            } catch let errorFromDecoder {
                DispatchQueue.main.async {
                    completion(nil, errorFromDecoder)
                }
            }
        }.resume()
    }
}

enum Router {
    case classes //
    case conditions
    case damageTypes
    case equipment
    case monsters
    case races //
    case skills //
    case abilityScores //
    case subclasses //
    case subraces //
    
    static var baseUrl = "https://www.dnd5eapi.co/api/"
    
    var endpoint: String {
        switch self {
        case .classes:
            return "\(Router.baseUrl)classes"
        case .conditions:
            return  "\(Router.baseUrl)conditions"
        case .damageTypes:
            return  "\(Router.baseUrl)damage-types"
        case .equipment:
            return  "\(Router.baseUrl)equipment"
        case .monsters:
            return  "\(Router.baseUrl)monsters"
        case .races:
            return "\(Router.baseUrl)races"
        case .skills:
            return "\(Router.baseUrl)skills"
        case .abilityScores:
            return "\(Router.baseUrl)ability-scores"
        case .subclasses:
            return "\(Router.baseUrl)subclasses"
        case .subraces:
            return "\(Router.baseUrl)subraces"
        }

    }
}
