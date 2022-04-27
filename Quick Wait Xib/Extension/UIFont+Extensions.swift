//
//  UIFont+Extensions.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 08/04/22.
//

import Foundation
import UIKit

extension UIFont {
    
    static var primaryFontRegular: UIFont {
        return UIFont.init(name: "QuicksandBook-Regular", size: 15) ??  UIFont.systemFont(ofSize: 15)
    }
    
}
