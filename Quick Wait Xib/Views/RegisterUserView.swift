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
        
        
    }
}
