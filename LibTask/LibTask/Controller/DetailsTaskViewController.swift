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
        descriptionTaskLabel.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
    }
}
