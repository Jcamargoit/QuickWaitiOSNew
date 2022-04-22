//
//  ChoiceView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 14/03/22.
//

import Foundation
import UIKit

class ChoiceView: UIView {

    var logoIcon: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: "logo")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var googleButton: CustomButtonView = {
        var btn = CustomButtonView()
        btn.setupBoldFont(value: .medium)
        btn.contentView.layer.cornerRadius = 14.5
        btn.setButtonTitle(text: "ENTRE COM O GOOGLE")
        btn.setImage(imageName: "iconGoogle")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    var facebookButton: CustomButtonView = {
        var btn = CustomButtonView()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value: .medium)
        btn.setButtonTitle(text: "ENTRE COM O FACEBOOK")
        btn.setImage(imageName: "iconFacebook")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    var viewSeparatorLeft: UIView = {
       var view = UIView()
        view.backgroundColor = UIColor(red: 0.10, green: 0.84, blue: 0.85, alpha: 1.00)
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var orLabel: UILabel = {
       var lbl = UILabel()
        lbl.text = "OU"
        lbl.textColor = UIColor(red: 0.10, green: 0.84, blue: 0.85, alpha: 1.00)
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var viewSeparatorRight: UIView = {
       var view = UIView()
         view.backgroundColor = UIColor(red: 0.10, green: 0.84, blue: 0.85, alpha: 1.00)
         view.layer.cornerRadius = 2
         view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var btnEnter: CustomButtonView = {
       var btn = CustomButtonView()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value: .medium)
        btn.setButtonTitle(text: "ENTRAR")
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()

    var btnSigin: CustomButtonView = {
       var btn = CustomButtonView()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value: .medium)
        btn.setButtonTitle(text: "CADASTRE-SE")
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()

    var btnGuest: CustomButtonView = {
        var btn = CustomButtonView()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value: .medium)
         btn.setButtonTitle(text: "ENTRAR COMO CONVIDADO")
         btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
        setupIconImage()
        setupGoogleButton()
        setupFacebookButton()
        setupSeparator()
        setupEnterButton()
        setupSiginButton()
        setupGuestButton()
    }

    func setupIconImage() {
        addSubview(logoIcon)
        NSLayoutConstraint.activate([
            logoIcon.topAnchor.constraint(equalTo: topAnchor, constant: size.height * 0.11),
            logoIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            logoIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            logoIcon.heightAnchor.constraint(equalToConstant: size.height * 0.2)
        ])
    }

    func setupGoogleButton() {
        addSubview(googleButton)
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: logoIcon.bottomAnchor, constant: size.height * 0.06),
            googleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            googleButton.widthAnchor.constraint(equalToConstant: size.width * 0.6),
            googleButton.heightAnchor.constraint(equalToConstant: 39)
        ])
    }

    func setupFacebookButton() {
        addSubview(facebookButton)
        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: size.height * 0.04),
            facebookButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            facebookButton.widthAnchor.constraint(equalToConstant: size.width * 0.6),
            facebookButton.heightAnchor.constraint(equalToConstant: 39)
        ])
    }

    func setupSeparator() {
        addSubview(viewSeparatorLeft)
        NSLayoutConstraint.activate([
            viewSeparatorLeft.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: size.height * 0.06),
            viewSeparatorLeft.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            viewSeparatorLeft.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -25),
            viewSeparatorLeft.heightAnchor.constraint(equalToConstant: 8)
        ])

        addSubview(orLabel)
        NSLayoutConstraint.activate([
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            orLabel.centerYAnchor.constraint(equalTo: viewSeparatorLeft.centerYAnchor)
        ])

        addSubview(viewSeparatorRight)
        NSLayoutConstraint.activate([
            viewSeparatorRight.topAnchor.constraint(equalTo: viewSeparatorLeft.topAnchor),
            viewSeparatorRight.bottomAnchor.constraint(equalTo: viewSeparatorLeft.bottomAnchor),
            viewSeparatorRight.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 25),
            viewSeparatorRight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35)
        ])
    }

    func setupEnterButton() {
        addSubview(btnEnter)
        NSLayoutConstraint.activate([
            btnEnter.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: size.height * 0.06),
            btnEnter.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnEnter.widthAnchor.constraint(equalToConstant: size.width * 0.6),
            btnEnter.heightAnchor.constraint(equalToConstant: 39)
        ])
    }

    func setupSiginButton() {
        addSubview(btnSigin)
        NSLayoutConstraint.activate([
            btnSigin.topAnchor.constraint(equalTo: btnEnter.bottomAnchor, constant: size.height * 0.04),
            btnSigin.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnSigin.widthAnchor.constraint(equalToConstant: size.width * 0.6),
            btnSigin.heightAnchor.constraint(equalToConstant: 39)
        ])
    }

    func setupGuestButton() {
        addSubview(btnGuest)
        NSLayoutConstraint.activate([
            btnGuest.topAnchor.constraint(equalTo: btnSigin.bottomAnchor, constant: size.height * 0.04),
            btnGuest.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnGuest.widthAnchor.constraint(equalToConstant: size.width * 0.6),
            btnGuest.heightAnchor.constraint(equalToConstant: 39)
        ])
    }
}
