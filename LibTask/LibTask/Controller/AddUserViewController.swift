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
    @IBOutlet weak var birthDateTextField: UITextField!
    
    let sendAlert = SendAlert()
    
    var userService = UserService(userSession: URLSession(configuration: .default))
    
    @IBAction func creatUser(_ sender: Any) {
        guard lastNametextField.text! != "" && firstNameTextField.text! != "" && birthDateTextField.text! != "" else {
            self.present(self.sendAlert.alert(message: "Données manquantes."), animated: true)
            return
        }
        requestCreationUser()
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    //Allows to create a user
    func requestCreationUser() {
        let parameters = ["firstname": firstNameTextField.text!, "lastname": lastNametextField.text!, "username": firstNameTextField.text!+lastNametextField.text!, "password": birthDateTextField.text!, "admin": "0"]
        
        userService.addUser(parameters: parameters)
    }
}
