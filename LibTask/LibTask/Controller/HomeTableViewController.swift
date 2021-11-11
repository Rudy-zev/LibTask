//
//  HomeViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var currentUserSession: UserSession!
    
    var taskService = TaskService(taskSession: URLSession(configuration: .default))
    let sendAlert = SendAlert()
    
    var allTask: [TaskUser]?
    
    @IBOutlet weak var addUserButton: UIBarButtonItem!
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    //TODO Remplacer par donner de la bdd 
    var allUser: [User]!
    
    override func loadView() {
        super.loadView()
        
        addUserButton.isEnabled = false
        addTaskButton.isEnabled = false
        
        if currentUserSession.admin == "1" {
            addUserButton.isEnabled = true
            addTaskButton.isEnabled = true
        }
    }
    
    func getAllTask(idUser: String) {
        let parameters = ["iduser": idUser]
        
        taskService.getAllTask(parameters: parameters) { (sucess, taskUser) in
            DispatchQueue.main.async {
                guard taskUser!.count != 0 else {
                    self.present(self.sendAlert.alert(message: "Cette utilisateur n'a aucune tache pour le moment."), animated: true)
                    return
                }
                self.allTask = taskUser
                self.performSegue(withIdentifier: "userTaskSegue", sender: self)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUser.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        cell.userLabel.text = allUser[indexPath.row].firstname + " " + allUser[indexPath.row].lastname
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getAllTask(idUser: allUser[indexPath.row].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let taskVC = segue.destination as? TaskTableViewController else { return }
        taskVC.task = allTask
    }
}

