//
//  PersonagemTableViewCell.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 21/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import UIKit

class PersonagemTableViewCell: UITableViewCell {

    @IBOutlet weak var nomePersonagem: UILabel!
    @IBOutlet weak var personagemImage: UIImageView!
    @IBOutlet weak var classeLabel: UILabel!
    @IBOutlet weak var racaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
