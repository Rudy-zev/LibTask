//
//  SendAlert.swift
//  LibTask
//
//  Created by Rudy on 10/11/2021.
//

import UIKit

class SendAlert {
    static func presentAlertError(errorMessage: String, uiViewController : UIViewController) {
        let alertVC = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        uiViewController.present(alertVC, animated: true, completion: nil)
    }
}

