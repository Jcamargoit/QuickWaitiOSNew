//
//  LoginView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 10/03/22.
//

import UIKit

class LoginView: UIView {
    
    var iconImage: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: "logo")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var labelUser: UILabel = {
       var lbl = UILabel()
        lbl.text = "Usuário:"
        lbl.textColor = UIColor(red: 0.18, green: 0.75, blue: 0.76, alpha: 1.00)
        lbl.font = UIFont.init(name: "QuicksandBook-Regular", size: 24)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtUser: UITextView = {
       var txt = UITextView()
        txt.layer.shadowOpacity = 4
        txt.layer.shadowColor = UIColor.black.cgColor
        txt.layer.shadowOffset = CGSize.init(width: 12, height: 12)
        txt.layer.cornerRadius = 12
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var labelPassword: UILabel = {
       var lbl = UILabel()
        lbl.text = "Senha:"
        lbl.textColor = UIColor(red: 0.18, green: 0.75, blue: 0.76, alpha: 1.00)
        lbl.font = UIFont.init(name: "QuicksandBook-Regular", size: 24)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtPassword: UITextView = {
       var txt = UITextView()
        txt.layer.shadowOpacity = 4
        txt.layer.shadowColor = UIColor.black.cgColor
        txt.layer.shadowOffset = CGSize.init(width: 12, height: 12)
        txt.layer.cornerRadius = 12
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var labelForgotPass: UILabel = {
       var lbl = UILabel()
        lbl.text = "Esqueceu sua senha?"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var buttonForgot: UIButton = {
        var btn = UIButton()
        btn.setTitle("Clique aqui", for: .normal)
        btn.titleLabel?.textColor = .link
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var buttonEnter: UIButton = {
       var btn = UIButton()
        btn.setTitle("Entrar", for: .normal)
        btn.titleLabel?.textColor = UIColor(red: 0.18, green: 0.75, blue: 0.76, alpha: 1.00)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12
        btn.layer.shadowOpacity = 12
        btn.layer.shadowRadius = 12
        return btn
    }()
    
    var imageReturn: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: "iconBackRegister")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubView()
    }
    
    func createSubView() {
        setupLogo()
        setupUserText()
        setupPasswordText()
        setupForgotLabel()
        setupButtonEnter()
        setupBack()
    }
    
    func setupLogo() {
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: topAnchor),
            iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            iconImage.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            iconImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupUserText() {
        
        NSLayoutConstraint.activate([
            labelUser.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 25),
            labelUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            labelUser.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
        ])
        
        NSLayoutConstraint.activate([
            txtUser.topAnchor.constraint(equalTo: labelUser.bottomAnchor, constant: 4),
            txtUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            txtUser.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            txtUser.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func setupPasswordText() {
        
        NSLayoutConstraint.activate([
            labelPassword.topAnchor.constraint(equalTo: txtUser.bottomAnchor, constant: 25),
            labelPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            labelPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
        ])
        
        NSLayoutConstraint.activate([
            txtPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 4),
            txtPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            txtPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            txtPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func setupForgotLabel() {
        NSLayoutConstraint.activate([
            labelForgotPass.topAnchor.constraint(equalTo: txtPassword.bottomAnchor, constant: 15),
            labelForgotPass.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
        ])
        
        NSLayoutConstraint.activate([
            buttonForgot.centerYAnchor.constraint(equalTo: labelForgotPass.centerYAnchor),
            buttonForgot.leadingAnchor.constraint(equalTo: labelForgotPass.trailingAnchor, constant: 5),
            buttonForgot.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupButtonEnter() {
        NSLayoutConstraint.activate([
            buttonEnter.topAnchor.constraint(equalTo: labelForgotPass.bottomAnchor, constant: 15),
            buttonEnter.widthAnchor.constraint(equalToConstant: size.width * 0.3),
            buttonEnter.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonEnter.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func setupBack() {
        NSLayoutConstraint.activate([
            imageReturn.topAnchor.constraint(equalTo: buttonEnter.bottomAnchor, constant: 10),
            imageReturn.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageReturn.widthAnchor.constraint(equalToConstant: 25),
            imageReturn.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
}
