//
//  StatusPersonagemViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 21/01/20.
//  Copyright © 2020 Jonathan de Pinho Silva. All rights reserved.
//

import UIKit

class StatusPersonagemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Criar os outlets
    
    var atributosPersonagem: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.picker.delegate = self
        self.picker.dataSource = self
        
        atributosPersonagem = ["8", "10", "12", "13", "14", "15"]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return atributosPersonagem.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return atributosPersonagem[row]
    }
    
    // Capture the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //labelTeste.text = atributosPersonagem[row] //Tem que criar o outlet primeiro
        self.view.endEditing(true)
    }
    
}
