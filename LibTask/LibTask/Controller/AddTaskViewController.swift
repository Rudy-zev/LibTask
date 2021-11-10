//
//  AddTaskViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit

class AddTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //TODO Remplacer par donner de la bdd 
    let user: [User] = [User(firstName: "rudy", lastName: "geoffray" ,admin: false), User(firstName: "paul", lastName: "distil" ,admin: false)]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return user.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return user[row].firstName
    }
    
    
}
