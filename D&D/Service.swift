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
    
    static var baseUrl = "https://www.dnd5eapi.co"
    
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
    
    public static func load(path: String, completionHandler: @escaping ([RootStruct]?) -> Void) {
        guard let url = URL(string: path) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            if let data = data, let response = response {
                
                guard let json = try? JSONDecoder().decode(APIClasses.self ,from: data) else {
                    print("Not json")
                    return
                }
                
                completionHandler(json.results)
                
            } else {
                print("Error")
                return
            }
        }.resume()
    }
    
    public static func loadGeneric<T: Decodable>(path: String, type: T.Type, completionHandler: @escaping (T?) -> Void) {
        guard let url = URL(string: path) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            if let data = data, let response = response {
                
                do {
                    let json = try JSONDecoder().decode(type ,from: data)
                    completionHandler(json)
                } catch {
                    print("Not json: \(error.localizedDescription)")
                }
                
                
            } else {
                print("Error")
                return
            }
        }.resume()
    }
    
}
