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
        super.viewDidLoad()
        
        self.personageNameLabel.text = (personagem.value(forKey: "nome") as! String)
        self.personageClassLabel.text = (personagem.value(forKey: "classe") as! String)
        self.racePersonagemLabel.text = (personagem.value(forKey: "raca") as! String)
        self.personageLifeLabel.text = "10" //(personagem.value(forKey: "vida") as! String)
        self.personageDefenseLabel.text = "10" //(personagem.value(forKey: "colete") as! String)
        
        self.personageStrongLabel.text = String(personagem.value(forKey: "forca") as! Int32)
        self.personageDextLabel.text = String(personagem.value(forKey: "destreza") as! Int32)
        self.personageSmartLabel.text = String(personagem.value(forKey: "inteligencia") as! Int32)
        self.personageWisdomLabel.text = String(personagem.value(forKey: "sabedoria") as! Int32)
        self.personageConstitutionLabel.text = String(personagem.value(forKey: "constituicao") as! Int32)
        self.personageCharismaLabel.text = String(personagem.value(forKey: "carisma") as! Int32)
    }

}
