//
//  TaskTableViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit

class TaskTableViewController: UITableViewController {
    var user: User!
    var taskSelected: TaskUser?
    
    var task: [TaskUser]?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleTaskLabel.text = task![indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskSelected = task![indexPath.row]
        
        performSegue(withIdentifier: "detailTaskSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailsTaskViewController else { return }
        detailVC.task = taskSelected
    }
}
