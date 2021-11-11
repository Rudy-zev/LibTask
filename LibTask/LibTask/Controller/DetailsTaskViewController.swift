//
//  DetailsTaskViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit

class DetailsTaskViewController: UIViewController {
    var task: TaskUser!

    @IBOutlet weak var titleTask: UILabel!
    @IBOutlet weak var userTask: UILabel!
    @IBOutlet weak var startingDate: UILabel!
    @IBOutlet weak var endingDate: UILabel!
    @IBOutlet weak var descriptionTaskLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureTask()
    }
    
    private func configureTask() {
        titleTask.text = task.title
        userTask.text = task.iduser
        //TODO Changer de format les date
        startingDate.text = "27/01/2021"
        endingDate.text = "28/01/2021"
        descriptionTaskLabel.text = task.description
    }
}
