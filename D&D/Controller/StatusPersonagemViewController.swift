//
//  StatusPersonagemViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 21/01/20.
//  Copyright © 2020 Jonathan de Pinho Silva. All rights reserved.
//

import UIKit

class StatusPersonagemViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

}


extension StatusPersonagemViewController {
    @IBAction func unwindWithSelected(segue: UIStoryboardSegue) {
        if let selectAttributeController = segue.source as? SelectAttributeViewController,
            let updatedAttribute = selectAttributeController.attribute {
            
        }
    }
}
