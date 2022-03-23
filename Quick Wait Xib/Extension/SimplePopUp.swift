//
//  SimplePopUp.swift
//  Quick Wait Xib
//
//  Created by Juninho on 09/02/22.
//

import Foundation
import UIKit


extension UIViewController {

    func simplePopUp(title:String, mensage:String) {
        let alert = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
