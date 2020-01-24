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
    var personagem = PersonagemModel()
    
    var valoresVaziosAlert: UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableVIew.delegate = self
        self.tableVIew.dataSource = self
        
        self.valoresVaziosAlert = UIAlertController(title: "Valores", message: "Preencha todos os campos", preferredStyle: .alert)
        
        
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
        if segue.identifier == "status" {
            let statusController = segue.destination as? SelectStatusViewController
            statusController?.personagem = personagem
        }
        
        guard
            segue.identifier == "SelectAttributeSegue",
            let indePath = tableVIew.indexPathForSelectedRow,
            let selectAttributeController = segue.destination as? SelectAttributeViewController else {
                return
        }
        
        let selectedAttribute = attributes[indePath.row]
        selectAttributeController.attribute = selectedAttribute
    
//MARK: - enviar personagem
//        guard
//            segue.identifier == "StatusSegue",
//            let selectStatusController = segue.destination as? SelectStatusViewController else {
//                return
//        }
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
    
    func isValoresVazios() -> Bool {
        return personagem.nome.isEmpty || personagem.raca.isEmpty || personagem.classe.isEmpty || personagem.antecedente.isEmpty || personagem.alinhamento.isEmpty || personagem.pericias.count == 0 || personagem.equipamentos.count == 0 || personagem.magias.count == 0
    }

    @IBAction func savePersonagem() {
        
        personagem.nome = nameTextField.text!
        
        personagem.classe = attributes[1].currentValue
        personagem.raca = attributes[0].currentValue
        personagem.antecedente = attributes[2].currentValue
        personagem.alinhamento = attributes[3].currentValue
        personagem.pericias = attributes[4].currentValues
        personagem.equipamentos = attributes[5].currentValues
        personagem.magias = attributes[6].currentValues
        
        if isValoresVazios() {
            let actionAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
            valoresVaziosAlert.addAction(actionAlert)
            
            present(valoresVaziosAlert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "status", sender: personagem)
        }

    }
}
