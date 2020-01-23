//
//  ViewController.swift
//  D&D
//
//  Created by Jonathan Silva on 19/01/20.
//  Copyright © 2020  Jonathan Silva. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var classes: [RootStruct] = []
    var races: [RootStruct] = []
    var equipments: [RootStruct] = []
    var spells: [RootStruct] = []
    var categories: [RootStruct] = []
    
    var race: SpecificRace?
    var classe: Class?
    var equipment: SpecificEquipment?
    var spell: SpecificSpell?
    var nivelClasse: ClasseEspecifica?
    var magiaIndividual:[MagiasModel]=[]
    var contador:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var rogerinho:Personagem = Personagem()
        rogerinho.setPersonagem(nome: "Rogerinho", classe: .feiticeiro, raca: Raca.elfoAlto, antecedente: Antecedente.orfao, alinhamento: .lealBom)


        Router.loadGeneric(path: "http://www.dnd5eapi.co/api/classes/ranger", type: Class.self) { [weak self] rogerinhofake in
            self?.classe = rogerinhofake ?? nil
             guard let classe = self?.classe else { return }
            
            Router.loadGeneric(path: "http://www.dnd5eapi.co/api/spells", type: APIClasses.self){[weak self ] magias in
                guard let magias = magias else{return}
                let complemento = magias.results
                print(Router.baseUrl+complemento[1].url)
                for i in magias.results{
                    Router.loadGeneric(path: Router.baseUrl+i.url, type: MagiasModel.self){ magia in
                        guard let magia = magia else {return}
                        self?.magiaIndividual += [magia]
                        guard let magias = self?.magiaIndividual else {return}
                        if(magias.count == 318){
                            
                            guard let magiasFiltradas = MagiasModel.filtrarMagiaPorClasse(magias: magias, personagem:rogerinho) ?? nil else {return}
                                let urlLevelClasse = Router.baseUrl + classe.url + "/levels/1"
                                Router.loadGeneric(path: "http://dnd5eapi.co/api/races/elf", type: SpecificRace.self) { raca in
                                    self?.race = raca ?? nil
                                    Router.loadGeneric(path:urlLevelClasse, type: ClasseEspecifica.self) { classeLevel in
                                        self?.nivelClasse = classeLevel ?? nil


                                        guard let race = self?.race else { return }
                                        guard let nivelClasse = self?.nivelClasse else { return }

                    //                    print("Nome: "+classe.name)
                    //                    print("Quantidade de Proficiencias: \(classe.proficiencies.count)")
                    //                    classe.proficiencies.forEach {
                    //                        print("  - "+$0.name)
                    //                    }
                                        var listaTreits:[String] = []
                                        for i in race.traits{
                                            listaTreits += [i.name]
                                        }

                                        var listaProficience:[String] = []

                                        for i in classe.proficiencies{
                                            listaProficience += [i.name]
                                            //print(i.name)
                                        }
                                        rogerinho.setPersonagem(forca: 16, destreza: 16, inteligencia: 16, sabedoria: 16, constituicao: 16, carisma: 16, traits: listaTreits, magias: magiasFiltradas.map({magia in return magia.name}), classeJson: classe, classeBonusLevelJson: nivelClasse)

                                        rogerinho.setPersonagem(pericias: [Pericias.acrobacia,Pericias.atuacao])
                                        print(rogerinho.nome)
                                        print("Magias do ROGERINHO: ",rogerinho.magias)


                                    }
                                }
                            
                            
                        }
                        
                    }
                }
            
            }


        }
        

        
        
        
        
    }
    
    
    
    
    

}

/*class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .yellow
        return tableView
    }()
    
    var monsters: [RootStruct]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.view.backgroundColor = .red
        
        
        Service<Classes>().get(withRoute: .monsters) { (classes, error) in
            self.monsters = classes?.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let monster = self.monsters?[indexPath.row] else {return cell}
        
        cell.textLabel?.text = monster.name
        return cell
    }
}*/
