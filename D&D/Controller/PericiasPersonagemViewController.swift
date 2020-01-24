//
//  PericiasPersonagemViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 22/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import UIKit

class PericiasPersonagemViewController: UIViewController {
    
    @IBOutlet weak var tableViewPericias: UITableView!
    
    let pericias: [String] = ["Pericia 1", "Pericia 2", "Pericia 3", "Pericia 4"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.tableViewPericias.delegate = self
        self.tableViewPericias.dataSource = self
    }

}


extension PericiasPersonagemViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return pericias.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "periciaCell") as! PericiaTableViewCell
            
        cell.periciaLabel.text = pericias[indexPath.row]
            
        return cell
            
    }
        
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
        
}
