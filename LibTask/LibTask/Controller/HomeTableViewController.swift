//
//  HomeViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var userSelected: User?
    
    @IBOutlet weak var addUserButton: UIBarButtonItem!
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    //TODO Remplacer par donner de la bdd 
    let user: [User] = [User(firstName: "rudy", lastName: "geoffray" ,admin: false), User(firstName: "paul", lastName: "distil" ,admin: false)]
        
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        cell.userLabel.text = user[indexPath.row].firstName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelected = user[indexPath.row]
        
        performSegue(withIdentifier: "userTaskSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? TaskTableViewController else { return }
        detailVC.user = userSelected
    }
}

