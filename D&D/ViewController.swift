//
//  ViewController.swift
//  D&D
//
//  Created by Jonathan Silva on 19/01/20.
//  Copyright © 2020  Jonathan Silva. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var classes: [RootStruct] = []
    var races: [RootStruct] = []
    var equipments: [RootStruct] = []
    var spells: [RootStruct] = []
    var categories: [RootStruct] = []
    var race: SpecificRace?
    var classe: Class?
    var equipment: SpecificEquipment?
    var spell: SpecificSpell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGeneric(path: "http://www.dnd5eapi.co/api/spells/blade-barrier", type: spell) { jsonStructs in
            if let jsonStructs = jsonStructs {
                self.spell = jsonStructs
                print(self.spell)
            } else {
                print("Error")
                self.spell = nil
            }
        }
    }

    func loadGeneric<T: Decodable>(path: String, type: T, completionHandler: @escaping (T?) -> Void) {
        guard let url = URL(string: path) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            if let data = data, let response = response {
                
                guard let json = try? JSONDecoder().decode(T.self ,from: data) else {
                    print("Not json")
                    return
                }
                
                completionHandler(json)
                
            } else {
                print("Error")
                return
            }
        }.resume()
    }
    
    func load(path: String, completionHandler: @escaping ([RootStruct]?) -> Void) {
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
}

/*class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .yellow
        return tableView
    }()
    
    var monsters: [RootStruct]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.view.backgroundColor = .red
        
        
        Service<Classes>().get(withRoute: .monsters) { (classes, error) in
            self.monsters = classes?.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let monster = self.monsters?[indexPath.row] else {return cell}
        
        cell.textLabel?.text = monster.name
        return cell
    }
}*/
