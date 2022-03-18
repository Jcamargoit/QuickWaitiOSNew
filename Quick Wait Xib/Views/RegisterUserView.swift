//
//  RegisterUserView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 15/03/22.
//

import Foundation
import UIKit

class RegisterUserView: UIView {
    
    var bottomScroll: NSLayoutConstraint?
    
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
    
    var topColorView: UIView = {
       var view = UIView()
        view.backgroundColor = UIColor(red: 0.74, green: 0.98, blue: 0.95, alpha: 1.00)
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
        view.backgroundColor = UIColor(red: 0.74, green: 0.98, blue: 0.95, alpha: 1.00)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.6
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
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
        txt.setupNewTypeInput(input: .alphabet)
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldBirthDay: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setupNewTypeInput(input: .numberPad)
        txt.setTitle(value: "Data de nascimento")
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldPhone: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "Celular")
        txt.setupNewTypeInput(input: .numberPad)
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldEmail: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "E-mail")
        txt.setupNewTypeInput(input: .emailAddress)
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldCPF: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "CPF")
        txt.setupNewTypeInput(input: .numberPad)
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldPassword: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "Senha")
        txt.setupNewTypeInput(input: .default)
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var fieldConfirmPassword: RegisterCustomTextfieldView = {
       var txt = RegisterCustomTextfieldView()
        txt.setTitle(value: "Confirmar Senha")
        txt.setupNewTypeInput(input: .default)
        txt.makeTextRequired()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var imageReturn: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: "iconBackRegister")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var imageNext: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: "iconNextRegister")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
    
    func createSubviews() {
        
        backgroundColor = UIColor(red: 0.87, green: 1.00, blue: 1.00, alpha: 1.00)
        
        setupScroll()
        setupStack()
        setupContentView()
        setupBack()
        setupNext()
    }
    
    func setupScroll() {
        
        bottomScroll = scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        
        addSubview(scrollView)
               NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                bottomScroll!,
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
        
        contentView.addSubview(topColorView)
        NSLayoutConstraint.activate([
            topColorView.bottomAnchor.constraint(equalTo: topImage.topAnchor),
            topColorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topColorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topColorView.heightAnchor.constraint(equalToConstant: size.height * 1)
        ])
        
        topImage.addSubview(iconLogo)
        NSLayoutConstraint.activate([
            iconLogo.topAnchor.constraint(equalTo: topImage.topAnchor, constant: size.height * 0.03),
            iconLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconLogo.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconLogo.heightAnchor.constraint(equalToConstant: size.height * 0.15)
        ])
        
        
        contentView.addSubview(siginView)
        NSLayoutConstraint.activate([
            siginView.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 30),
            siginView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            siginView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        contentView.addSubview(fieldName)
        NSLayoutConstraint.activate([
            fieldName.topAnchor.constraint(equalTo: siginView.topAnchor, constant: 15),
            fieldName.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldName.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldName.heightAnchor.constraint(equalToConstant: 60)
        ])
        contentView.addSubview(fieldBirthDay)
        NSLayoutConstraint.activate([
            fieldBirthDay.topAnchor.constraint(equalTo: fieldName.bottomAnchor, constant: 20),
            fieldBirthDay.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldBirthDay.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldBirthDay.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        contentView.addSubview(fieldPhone)
        NSLayoutConstraint.activate([
            fieldPhone.topAnchor.constraint(equalTo: fieldBirthDay.bottomAnchor, constant: 20),
            fieldPhone.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldPhone.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldPhone.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        contentView.addSubview(fieldEmail)
        NSLayoutConstraint.activate([
            fieldEmail.topAnchor.constraint(equalTo: fieldPhone.bottomAnchor, constant: 20),
            fieldEmail.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldEmail.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldEmail.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        contentView.addSubview(fieldCPF)
        NSLayoutConstraint.activate([
            fieldCPF.topAnchor.constraint(equalTo: fieldEmail.bottomAnchor, constant: 20),
            fieldCPF.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldCPF.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldCPF.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        contentView.addSubview(fieldPassword)
        NSLayoutConstraint.activate([
            fieldPassword.topAnchor.constraint(equalTo: fieldCPF.bottomAnchor, constant: 20),
            fieldPassword.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldPassword.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldPassword.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        contentView.addSubview(fieldConfirmPassword)
        NSLayoutConstraint.activate([
            fieldConfirmPassword.topAnchor.constraint(equalTo: fieldPassword.bottomAnchor, constant: 20),
            fieldConfirmPassword.leadingAnchor.constraint(equalTo: siginView.leadingAnchor, constant: 5),
            fieldConfirmPassword.trailingAnchor.constraint(equalTo: siginView.trailingAnchor, constant: 5),
            fieldConfirmPassword.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    func setupBack() {
        contentView.addSubview(imageReturn)
        NSLayoutConstraint.activate([
            imageReturn.topAnchor.constraint(equalTo: fieldConfirmPassword.bottomAnchor, constant: 50),
            imageReturn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -size.width * 0.25),
            imageReturn.widthAnchor.constraint(equalToConstant: 50),
            imageReturn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupNext() {
        contentView.addSubview(imageNext)
        NSLayoutConstraint.activate([
            imageNext.topAnchor.constraint(equalTo: fieldConfirmPassword.bottomAnchor, constant: 50),
            imageNext.centerXAnchor.constraint(equalTo: centerXAnchor, constant: size.width * 0.25),
            imageNext.widthAnchor.constraint(equalToConstant: 50),
            imageNext.heightAnchor.constraint(equalToConstant: 50),
            imageNext.bottomAnchor.constraint(equalTo: siginView.bottomAnchor, constant: -20),
            imageNext.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    
    func isEditing() {
        self.bottomScroll?.constant = -size.height * 0.32
    }
    
    func stopEditing() {
        self.bottomScroll?.constant = 0
    }
}
