//
//  ConnecionViewController.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import UIKit


class ConnexionViewController : UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var userService = UserService(userSession: URLSession(configuration: .default))
    
    var allUser: [User] = [User(id: "",firstname: "", lastname: "" )]
    
    var currentUserSession = UserSession(admin: "", username: "")
    let sendAlert = SendAlert()
    
    
    @IBAction func didTapConnexionButton(_ sender: Any) {
        login()
    }
    
    
    //Allows to launch the request to check if the user exists
    func login() {
        guard (userNameTextField.text != "" || passwordTextField.text != "") else {
            self.present(sendAlert.alert(message: "Information manquante."), animated: true)
            return
        }
        
        let currentLogin = Login(username: userNameTextField.text!, password: passwordTextField.text!)
        let parameters = ["username":currentLogin.username, "password":currentLogin.password]
        
        userService.checkLogin(parameters: parameters) { (sucess, userSession) in
            DispatchQueue.main.async {
                
                guard userSession!.count != 0 else {
                    self.present(self.sendAlert.alert(message: "Aucun utilisateur"), animated: true)
                    return
                }
                
                guard userSession?[0].username == self.userNameTextField.text else {
                    self.present(self.sendAlert.alert(message: "Utilisateur inconnu"), animated: true)
                    return
                }
                
                self.currentUserSession.admin = userSession![0].admin
                self.currentUserSession.username = userSession![0].username
                self.getAllUser()
            }
        }
    }
    
    //Allows to launch the request to retrieve all non-admin users
    func getAllUser() {
        userService.getAllUser { (sucess, allUser) in
            DispatchQueue.main.async {
                guard allUser != nil else { return }
                if allUser!.count > 0 {
                    self.allUser = allUser!
                    self.performSegue(withIdentifier: "connexionSegue", sender: self)
                } else {
                    print("Aucune data")
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeVC = segue.destination as? UINavigationController else { return }
        guard let homeVCVerif = homeVC.topViewController as? HomeTableViewController else { return }
        homeVCVerif.currentUserSession = currentUserSession
        homeVCVerif.allUser = allUser
    }
    
}
