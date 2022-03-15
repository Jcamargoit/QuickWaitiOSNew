//
//  RegisterUserView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 15/03/22.
//

import Foundation
import UIKit

class RegisterUserView: UIView {
    var topImage: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: "topRegister")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var iconLogo: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: .logo)?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var siginView: UIView = {
       var view = UIView()
        view.backgroundColor = .link
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}
