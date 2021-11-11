//
//  AddUserViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit

class AddUserViewController: UIViewController {
    @IBOutlet weak var lastNametextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var BirthDatePicker: UIDatePicker!
    
    let sendAlert = SendAlert()
    
    @IBAction func creatUser(_ sender: Any) {
        if lastNametextField.text == "" || firstNameTextField.text == "" {
            sendAlert.alert(message: "Information manquante.")
        } else {
        }
        
        
    }
}
