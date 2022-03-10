//  DismissKeyboard.swift
//  Quick Wait
//  Created by Juninho on 24/01/22.

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardOnTap() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hidenKeyboard))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func hidenKeyboard() {
        view.endEditing(true)
        
    }
}
