//
//  RegisterUserView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 15/03/22.
//

import Foundation
import UIKit

class RegisterUserView: UIView {
    
    var scrollView: UIScrollView = {
        var scrl = UIScrollView()
        scrl.showsVerticalScrollIndicator = false
        scrl.translatesAutoresizingMaskIntoConstraints = false
        return scrl
    }()
    
    var stackSigin: UIStackView = {
            var stk = UIStackView()
            stk.axis = .vertical
            stk.translatesAutoresizingMaskIntoConstraints = false
            return stk
        }()
    
    var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    var stackVerticaly: UIStackView = {
       var stk = UIStackView()
        stk.axis = .vertical
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    var fieldName: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "Nome")
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldBirthDay: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "Data de nascimento")
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldPhone: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "Celular")
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldEmail: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "E-mail")
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldCPF: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "CPF")
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldPassword: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "Senha")
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldConfirmPassword: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "Confirmar Senha")
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var iconReturn: UIImageView = {
        var img = UIImageView()
         img.image = UIImage(named: "iconBackRegister")?.withRenderingMode(.alwaysOriginal)
         img.contentMode = .scaleAspectFit
         img.translatesAutoresizingMaskIntoConstraints = false
         return img
    }()
    
    var iconNext: UIImageView = {
        var img = UIImageView()
         img.image = UIImage(named: "iconNextRegister")?.withRenderingMode(.alwaysOriginal)
         img.contentMode = .scaleAspectFit
         img.translatesAutoresizingMaskIntoConstraints = false
         return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func createSubviews() {
        
    }
    
    func setupScroll() {
        addSubview(scrollView)
               NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
               ])
    }
    
    func setupStack() {
        scrollView.addSubview(stackSigin)
        NSLayoutConstraint.activate([
            stackSigin.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackSigin.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackSigin.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackSigin.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackSigin.widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
    
    func setupContentView() {
        stackSigin.addArrangedSubview(contentView)

        contentView.addSubview(topImage)
        NSLayoutConstraint.activate([
            topImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            topImage.heightAnchor.constraint(equalToConstant: size.height * 0.2)
        ])
        
        contentView.addSubview(iconLogo)
        NSLayoutConstraint.activate([
            iconLogo.topAnchor.constraint(equalTo: topAnchor, constant: size.height * 0.06),
            iconLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconLogo.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconLogo.heightAnchor.constraint(equalToConstant: size.height * 0.12)
        ])
        
        contentView.addSubview(siginView)
        NSLayoutConstraint.activate([
            siginView.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 30),
            siginView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            siginView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        siginView.addSubview(fieldName)
        NSLayoutConstraint.activate([
            fieldName.topAnchor.constraint(equalTo: siginView.topAnchor, constant: 15),
            fieldName.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldName.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldName.heightAnchor.constraint(equalToConstant: 70)
        ])
        siginView.addSubview(fieldBirthDay)
        NSLayoutConstraint.activate([
            fieldBirthDay.topAnchor.constraint(equalTo: fieldName.topAnchor, constant: 15),
            fieldBirthDay.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldBirthDay.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldBirthDay.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        siginView.addSubview(fieldPhone)
        NSLayoutConstraint.activate([
            fieldPhone.topAnchor.constraint(equalTo: fieldBirthDay.topAnchor, constant: 15),
            fieldPhone.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldPhone.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldPhone.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        siginView.addSubview(fieldEmail)
        NSLayoutConstraint.activate([
            fieldEmail.topAnchor.constraint(equalTo: fieldPhone.topAnchor, constant: 15),
            fieldEmail.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldEmail.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldEmail.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        siginView.addSubview(fieldCPF)
        NSLayoutConstraint.activate([
            fieldCPF.topAnchor.constraint(equalTo: fieldEmail.topAnchor, constant: 15),
            fieldCPF.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldCPF.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldCPF.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        siginView.addSubview(fieldPassword)
        NSLayoutConstraint.activate([
            fieldPassword.topAnchor.constraint(equalTo: fieldCPF.topAnchor, constant: 15),
            fieldPassword.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldPassword.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldPassword.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        siginView.addSubview(fieldConfirmPassword)
        NSLayoutConstraint.activate([
            fieldConfirmPassword.topAnchor.constraint(equalTo: fieldPassword.topAnchor, constant: 15),
            fieldConfirmPassword.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldConfirmPassword.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldConfirmPassword.heightAnchor.constraint(equalToConstant: 70),
            fieldConfirmPassword.bottomAnchor.constraint(equalTo: siginView.bottomAnchor, constant: -15),
            siginView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 25)
        ])
        
    }
}
