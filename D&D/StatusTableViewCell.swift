//
//  StatusTableViewCell.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 23/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import Foundation
import UIKit

class StatusTableViewCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var attribute: Attribute!
    var pickerData: Array<String>!
    var currentValue: String!
    let numbers = ["8", "10", "12", "13", "14", "15"]
    
    weak var changeValueDelegate: ChangeValueDelegate!
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.textField.delegate = self
        
        self.createPickerView()
        self.dissmissPickerView()
    }


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentValue = pickerData[row]
        textField.text = currentValue
            
        attribute.currentValue = currentValue
        changeValueDelegate.changeValue(for: attribute)
    }
    
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        textField.inputView = pickerView
    }
    
    func dissmissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dissmissKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolBar
    }
    
    @objc func dissmissKeyboard() {
        changeValueDelegate.endEditing()
    }
 
}
