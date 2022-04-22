//
//  UIImageView+setRounded.swift
//  Quick Wait Xib
//
//  Created by Juninho on 18/04/22.
//

import Foundation
import UIKit

//Imagem Redonda
extension UIImageView {
    func setImageRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.clipsToBounds = true
        
//        img.layer.cornerRadius = 55
      
    }
}
