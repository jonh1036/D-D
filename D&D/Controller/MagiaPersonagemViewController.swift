//
//  MagiaPersonagemViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 22/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MagiaPersonagemViewController: UIViewController {

    @IBOutlet weak var magiaTableView: UITableView!
    
    let magias: [String] = ["Magia 1", "Magia 2", "Magia 3", "Magia 4"]
                
        override func viewDidLoad() {
        super.viewDidLoad()
                    
        self.magiaTableView.delegate = self
        self.magiaTableView.dataSource = self
    }

}

extension MagiaPersonagemViewController: UITableViewDelegate, UITableViewDataSource {
                
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return magias.count
    }
                
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    
        let cell = tableView.dequeueReusableCell(withIdentifier: "magiaCell") as! MagiaTableViewCell
                    
        cell.magiaLabel.text = magias[indexPath.row]
                    
        return cell
                    
    }
                
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
                
}
