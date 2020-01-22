//
//  CriarPersonagemViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 21/01/20.
//  Copyright © 2020 Jonathan de Pinho Silva. All rights reserved.
//

import UIKit

struct Attribute {
    var name: String
    var currentValue: String = ""
    var values: [String] = ["A", "B", "C"]
    var currentValues: [String] = []
}


class CriarPersonagemViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    
    var attributes = [
        Attribute(name: "raça"),
        Attribute(name: "classe"),
        Attribute(name: "antecedente"),
        Attribute(name: "tendência"),
        Attribute(name: "pericias")] {
        didSet {
            tableVIew.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableVIew.delegate = self
        self.tableVIew.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "SelectAttributeSegue",
            let indePath = tableVIew.indexPathForSelectedRow,
            let selectAttributeController = segue.destination as? SelectAttributeViewController else {
                return
        }
        let selectedAttribute = attributes[indePath.row]
        selectAttributeController.attribute = selectedAttribute
    }

}


extension CriarPersonagemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttributeCell", for: indexPath)
        
        let attribute = attributes[indexPath.row]
        
        cell.textLabel?.text = "adicionar \(attribute.name)"
        
        if attribute.name == "pericias" {
            print("PERICIASSS")
            cell.detailTextLabel?.text = attribute.currentValues.isEmpty ? "" : "OK"
            print(attribute.currentValues)
        } else {
            cell.detailTextLabel?.text = attribute.currentValue
        }
        
        cell.accessoryType = .disclosureIndicator
        return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}

extension CriarPersonagemViewController {
    @IBAction func unwindWithSelected(segue: UIStoryboardSegue) {
        if let selectAttributeController = segue.source as? SelectAttributeViewController,
            
            let updatedAttribute = selectAttributeController.attribute {
            for (index, attribute) in attributes.enumerated() {
                if attribute.name == updatedAttribute.name {
                    if updatedAttribute.name == "pericias" {
                        attributes[index].currentValues = updatedAttribute.currentValues
                    } else {
                        attributes[index].currentValue = updatedAttribute.currentValue
                    }
                    break
                }
            }
            
        }
    }
}
