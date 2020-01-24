//
//  PersonagemViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 21/01/20.
//  Copyright © 2020 Jonathan de Pinho Silva. All rights reserved.
//

import UIKit
import CoreData

class PersonagemViewController: UIViewController {

    @IBOutlet weak var personageNameLabel: UILabel!
    @IBOutlet weak var personageClassLabel: UILabel!
    @IBOutlet weak var racePersonagemLabel: UILabel!
    @IBOutlet weak var personageLevelLabel: UILabel!
    @IBOutlet weak var personageLifeLabel: UILabel!
    @IBOutlet weak var personageDefenseLabel: UILabel!
    @IBOutlet weak var personageStrongLabel: UILabel!
    @IBOutlet weak var personageDextLabel: UILabel!
    @IBOutlet weak var personageSmartLabel: UILabel!
    @IBOutlet weak var personageWisdomLabel: UILabel!
    @IBOutlet weak var personageConstitutionLabel: UILabel!
    @IBOutlet weak var personageCharismaLabel: UILabel!
    
    
    var personagem: NSManagedObject!
    
    override func viewDidLoad() {
        
        
        var personagemExibivel:Personagem = Personagem()
        
        
        
        
        guard let forca = personagem.value(forKey: "forca") as? Int else {return}
        guard let destreza = personagem.value(forKey: "destreza") as? Int else {return}
        guard let inteligenica = personagem.value(forKey: "inteligencia") as? Int else {return}
        guard let sabedoria = personagem.value(forKey: "sabedoria") as? Int else {return}
        guard let constituicao = personagem.value(forKey: "constituicao") as? Int else {return}
        guard let carisma = personagem.value(forKey: "carisma") as? Int else {return}
        
        personagemExibivel.setStatus(forca: forca, destreza: destreza, sabedoria: sabedoria, inteligencia: inteligenica, carisma: carisma, constituicao: constituicao)
        guard let racas:String = (personagem.value(forKey: "raca") as? String) else {return}
        personagemExibivel.setRaca(raca: racas)
        
        super.viewDidLoad()
        
        self.personageNameLabel.text = (personagem.value(forKey: "nome") as! String)
        self.personageClassLabel.text = (personagem.value(forKey: "classe") as! String)
        self.racePersonagemLabel.text = (personagem.value(forKey: "raca") as! String)
        self.personageLifeLabel.text = "10" //(personagem.value(forKey: "vida") as! String)
        self.personageDefenseLabel.text = "10" //(personagem.value(forKey: "colete") as! String)
        
        self.personageStrongLabel.text = String(personagemExibivel.status.forca)
        self.personageDextLabel.text = String(personagemExibivel.status.destreza)
        self.personageSmartLabel.text = String(personagemExibivel.status.inteligencia)
        self.personageWisdomLabel.text = String(personagemExibivel.status.sabedoria)
        self.personageConstitutionLabel.text = String(personagemExibivel.status.constituicao)
        self.personageCharismaLabel.text = String(personagemExibivel.status.carisma)
    }

}
