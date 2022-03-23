//
//  CustomTextField.swift
//  Quick Wait Xib
//
//  Created by Rafael Ortiz on 18/03/22.
//

import UIKit

class MainTextField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15),
         corner: CGFloat = 12, placeholderText: String = "") {
        
        self.insets = insets
        super.init(frame: .zero)
        
        backgroundColor = .white
        font = K.Fonts.mainTextField
        textColor = K.Colors.mainTextField
        placeholder = placeholderText
        
        layer.cornerRadius = corner
        layer.shadowOpacity = 0.6
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 3)
        layer.masksToBounds = false 
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
