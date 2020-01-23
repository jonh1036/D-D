//
//  SelectStatusViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 22/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SelectStatusViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let numbers = ["12", "13", "14", "15"]
    
    var attributes = [
        Attribute(name: "forca"),
        Attribute(name: "destreza")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        //salvar modificacoes
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}

extension SelectStatusViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatusTableViewCell", for: indexPath) as! StatusTableViewCell
        
        let attribute = attributes[indexPath.row]
        
        cell.label.text = attribute.name
        cell.textField.text = attribute.currentValue
        
        cell.attribute = attribute
        cell.changeValueDelegate = self
        cell.pickerData = numbers
        
        return cell
    }
}


extension SelectStatusViewController: ChangeValueDelegate {
    func changeValue(for newValue: Attribute) {
        if let indexNewValue = MySearch.search(attribute: newValue, in: attributes) {
            
            attributes[indexNewValue].currentValue = newValue.currentValue
        }
    }
    
    func endEditing() {
        self.view.endEditing(true)
        self.tableView.reloadData()
    }
}

