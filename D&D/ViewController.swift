//
//  ViewController.swift
//  D&D
//
//  Created by Jonathan Silva on 19/01/20.
//  Copyright © 2020  Jonathan Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let navBar: UINavigationController = {
       let navBar = UINavigationController()
        
        return navBar
    }()
    
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
        
        Service<Classes>().get(withRoute: .skills) { (classes, error) in
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
    
}
