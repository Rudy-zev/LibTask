//
//  AddTaskViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit

class AddTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //TODO Remplacer par donner de la bdd 
    let user: [User] = [User(id: "0",firstname: "rudy", lastname: "geoffray" ), User(id: "1", firstname: "paul", lastname: "distil")]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return user.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return user[row].firstname
    }
    
    
}
