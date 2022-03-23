//
//  CustomTextField.swift
//  Quick Wait Xib
//
//  Created by Rafael Ortiz on 18/03/22.
//

import UIKit

class CustomTextField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: .zero)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}
