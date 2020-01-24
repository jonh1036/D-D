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
    var isMultiplyValue: Bool = false
    var currentValue: String = ""
    var currentValues: [String] = []
    var values: [String] = []
}

class CriarPersonagemViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addImageButton: UIButton!
   
    var attributes = [Attribute]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableVIew.delegate = self
        self.tableVIew.dataSource = self
        
        attributes = [
           Attribute(name: "raça", values: Raca.all.map{value in value.rawValue}),
           Attribute(name: "classe"),
           Attribute(name: "antecedente", values: Antecedente.all.map{value in value.rawValue}),
           Attribute(name: "tendência", values: Alinhamento.all.map{value in value.rawValue}),
           Attribute(name: "pericias", isMultiplyValue: true),
           Attribute(name: "equipamentos", isMultiplyValue: true),
           Attribute(name: "magias", isMultiplyValue: true)]
        
        loadClasses()
        loadEquipamentos()

        tableVIew.reloadData()
    }
    
    func loadClasses() {
        Router.load(path: Router.classes.endpoint) {jsonResults in
            guard let jsonResults = jsonResults else{return}
            
            self.attributes[1].values = jsonResults.map {value in value.name}
        }
    }
    
    func loadMagias() {
        Router.load(path: Router.spells.endpoint) {jsonResults in
            guard let jsonResults = jsonResults else{return}
            
            self.attributes[6].values = jsonResults.map {value in value.name}
        }
        
    }
    
    func loadPericias() {
        let path = "\(Router.classes.endpoint)/\(attributes[1].currentValue.lowercased())"
        
        Router.loadGeneric(path: path, type: Class.self) { jsonResults in
            guard let jsonResults = jsonResults else{return}
            let values = jsonResults.proficiency_choices[0].from
            self.attributes[4].values = values.map{value in value.name}
        }
    }
    
    func loadEquipamentos() {
        
        Router.load(path: Router.equipment.endpoint) { jsonResults in
            guard let jsonResults = jsonResults else{return}
            
            self.attributes[5].values = jsonResults.map {value in value.name}
        }
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttributeCell", for: indexPath)
        
        let attribute = attributes[indexPath.row]
        
        cell.textLabel?.text = "Escolher \(attribute.name)"
        
        cell.accessoryType =  .disclosureIndicator
        
        if attribute.isMultiplyValue && !attribute.currentValues.isEmpty {
            cell.accessoryType =  .checkmark
            
        } else {
            cell.detailTextLabel?.text = attribute.currentValue
            
        }
        return cell
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
                    if updatedAttribute.isMultiplyValue {
                        attributes[index].currentValues = updatedAttribute.currentValues
                       
                    } else {
                        attributes[index].currentValue = updatedAttribute.currentValue
                        if index == 1 {
                            loadPericias()
                            loadMagias()
                        }
                    }
                    tableVIew.reloadData()
                    break
                }
            }
            
        }
    }
}
