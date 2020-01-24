//
//  SelectStatusViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 22/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SelectStatusViewController: UIViewController {
    
    var personagem: PersonagemModel!
    var vDefault = Int32("0")
    
    var valoresVaziosAlert: UIAlertController!
    
    @IBOutlet weak var tableView: UITableView!
    
    let numbers = ["8", "10", "12", "13", "14", "15"]
    
    var attributes = [
        Attribute(name: "Força"),
        Attribute(name: "Destreza"),
        Attribute(name: "Inteligência"),
        Attribute(name: "Sabedoria"),
        Attribute(name: "Constituição"),
        Attribute(name: "Carisma"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.valoresVaziosAlert = UIAlertController(title: "Valores", message: "Preencha todos os campos", preferredStyle: .alert)
        
        
    }
    
    
    func valoresVazios() -> Bool {
        return personagem.forca == vDefault || personagem.destreza == vDefault || personagem.inteligencia == vDefault || personagem.sabedoria == vDefault || personagem.constituicao == vDefault || personagem.carisma == vDefault
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        personagem.forca = Int32(attributes[0].currentValue)!
        personagem.destreza = Int32(attributes[1].currentValue)!
        personagem.inteligencia = Int32(attributes[2].currentValue)!
        personagem.sabedoria = Int32(attributes[3].currentValue)!
        personagem.constituicao = Int32(attributes[4].currentValue)!
        personagem.carisma = Int32(attributes[5].currentValue)!
        
        if valoresVazios() {
            let actionAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
            valoresVaziosAlert.addAction(actionAlert)
            
            present(valoresVaziosAlert, animated: true, completion: nil)
        }
        
        let dataManager = DataManager()
        
        let result = dataManager.savePersonagem(personagem)
        
        
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
        cell.textField.text = attribute.currentValue == "" ? "0" : attribute.currentValue
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

