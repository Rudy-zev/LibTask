//
//  SendAlert.swift
//  LibTask
//
//  Created by Rudy on 10/11/2021.
//

import UIKit

class SendAlert {
    func alert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
}
