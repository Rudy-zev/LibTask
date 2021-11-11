//
//  AddTaskViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit

class AddTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let sendAlert = SendAlert()
    
    var taskService = TaskService(taskSession: URLSession(configuration: .default))
    
    var allUser: [User]!
    var idUserSelected: String?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var userPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idUserSelected = allUser[0].id
    }
    
    @IBAction func tapCreationTaskButton(_ sender: Any) {
        guard titleTextField.text! != "" && descriptionTextField.text! != "" else {
            self.present(self.sendAlert.alert(message: "Données manquantes."), animated: true)
            return
        }
        requestCreationTask()
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
    
    func requestCreationTask() {
        let parameters = ["iduser": idUserSelected!, "title": titleTextField.text!, "description": descriptionTextField.text!]
        
        taskService.addTask(parameters: parameters)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allUser.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allUser[row].firstname + " " + allUser[row].lastname
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        idUserSelected = allUser[row].id
    }
    
}
