//
//  EquipamentoPersonagemViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 21/01/20.
//  Copyright © 2020 Jonathan de Pinho Silva. All rights reserved.
//

import UIKit

class EquipamentoPersonagemViewController: UIViewController {

    @IBOutlet weak var equipamentoTableView: UITableView!
    
    let equipamentos: [String] = ["Equipamento 1", "Equipamento 2", "Equipamento 3", "Equipamento 4"]
            
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.equipamentoTableView.delegate = self
        self.equipamentoTableView.dataSource = self
    }

}


extension EquipamentoPersonagemViewController: UITableViewDelegate, UITableViewDataSource {
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return equipamentos.count
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "equipamentoCell") as! EquipamentoTableViewCell
                
        cell.equipamentoLabel.text = equipamentos[indexPath.row]
                
        return cell
                
    }
            
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
            
}
