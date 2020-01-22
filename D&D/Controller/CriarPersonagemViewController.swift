//
//  CriarPersonagemViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 21/01/20.
//  Copyright © 2020 Jonathan de Pinho Silva. All rights reserved.
//

import UIKit

class CriarPersonagemViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    
    let atributos: [String] = ["Raça", "Classe", "Antecedente", "Tendência"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableVIew.delegate = self
        self.tableVIew.dataSource = self
    }

}


extension CriarPersonagemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return atributos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "atributoCell") as! AtributoTableViewCell
        
        cell.atributoLabel.text = atributos[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
