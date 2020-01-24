//
//  ListaPersonagensViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 21/01/20.
//  Copyright © 2020 Jonathan de Pinho Silva. All rights reserved.
//

import UIKit
import CoreData

class ListaPersonagensViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

 
    var personagensHere: [(nome: String, classe: String, raca: String, all: NSManagedObject)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
//        var char: PersonagemModel = PersonagemModel()
//        char.nome = "Mary"
//        let dataManager: DataManager = DataManager()
//        dataManager.deleteAll()
//        let isSaved = dataManager.savePersonagem(char)
//        let result = dataManager.retrivePersonagem(nome: "Mary")
//        let result = dataManager.retriveAllPersonagens()

//        print(result?.value(forKey: "nome") as! String)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let dataManager: DataManager = DataManager()
        let result = dataManager.retriveAllPersonagens()
        
        if let allPersonagens = result {
            
            personagensHere.removeAll()
            
            for r in allPersonagens {
                var novo: (nome: String, classe: String, raca: String, all: NSManagedObject)
                novo.nome = r.value(forKey: "nome") as! String
                novo.classe = r.value(forKey: "classe") as! String
                novo.raca = r.value(forKey: "raca") as! String
                novo.all = r
                personagensHere.append(novo)
            }
        }
        
        self.tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard
            segue.identifier == "PersonagemSegue",
            let indePath = tableView.indexPathForSelectedRow,
            let personagemController = segue.destination as? PersonagemViewController else {
                return
        }
        
        let personagemSelecionado = personagensHere[indePath.row]
        personagemController.personagem = personagemSelecionado.all
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personagensHere.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonagensCell", for: indexPath) as! PersonagemTableViewCell
        
        //cell.nomePersonagem.text = personagensList[indexPath.row].nome
        //cell.classeLabel.text = personagensList[indexPath.row].classe.rawValue
        //cell.racaLabel.text = personagensList[indexPath.row].raca.rawValue
        
        cell.nomePersonagem.text = personagensHere[indexPath.row].nome
        cell.classeLabel.text = personagensHere[indexPath.row].classe
        cell.racaLabel.text = personagensHere[indexPath.row].raca
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
