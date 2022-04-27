//
//  LoginView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 10/03/22.
//

import UIKit

class LoginView: UIView {
    
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
        lbl.font = UIFont.init(name: "QuicksandBook-Regular", size: 23)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var txtUser: UITextView = {
       var txt = UITextView()
        txt.font = UIFont.systemFont(ofSize: 26)
        txt.backgroundColor = .white
        txt.autocapitalizationType = .none
        txt.layer.masksToBounds = false
        txt.layer.shadowOpacity = 0.6
        txt.layer.shadowColor = UIColor.gray.cgColor
        txt.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        txt.layer.cornerRadius = 12
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var labelPassword: UILabel = {
       var lbl = UILabel()
        lbl.text = "Senha:"
        lbl.textColor = UIColor(red: 0.18, green: 0.75, blue: 0.76, alpha: 1.00)
        lbl.font = UIFont.init(name: "QuicksandBook-Regular", size: 23)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var txtPassword: UITextView = {
       var txt = UITextView()
        txt.font = UIFont.systemFont(ofSize: 26)
        txt.autocapitalizationType = .none
        txt.layer.shadowOpacity = 0.6
        txt.layer.masksToBounds = false
        txt.layer.shadowColor = UIColor.gray.cgColor
        txt.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        txt.layer.cornerRadius = 12
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var labelForgotPass: UILabel = {
       var lbl = UILabel()
        lbl.text = "Esqueceu sua senha?"
        lbl.font = UIFont.init(name: "QuicksandBook-Regular", size: 15)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var buttonForgot: UIButton = {
        var btn = UIButton()
        btn.setTitle("Clique aqui", for: .normal)
        btn.setTitleColor(.link, for: .normal)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    var buttonEnter: UIButton = {
       var btn = UIButton()
        btn.setTitle("Entrar", for: .normal)
        btn.setTitleColor(UIColor(red: 0.18, green: 0.75, blue: 0.76, alpha: 1.00), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12
        btn.layer.shadowOpacity = 0.6
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOffset = CGSize.init(width: 0, height: 3)
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

        backgroundColor = UIColor(red: 0.87, green: 1.00, blue: 1.00, alpha: 1.00)
        setupScroll()
        setupStack()
        setupContentView()
        setupLogo()
        setupUserText()
        setupPasswordText()
        setupForgotLabel()
        setupButtonEnter()
        setupBack()
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
    }

    func setupLogo() {
        contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.13),
            iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            iconImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            iconImage.heightAnchor.constraint(equalToConstant: size.height * 0.2)
        ])
    }

    func setupUserText() {
        contentView.addSubview(labelUser)
        NSLayoutConstraint.activate([
            labelUser.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 30),
            labelUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            labelUser.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])

        contentView.addSubview(txtUser)
        NSLayoutConstraint.activate([
            txtUser.topAnchor.constraint(equalTo: labelUser.bottomAnchor, constant: 4),
            txtUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            txtUser.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            txtUser.heightAnchor.constraint(equalToConstant: 50)
        ])

    }

    func setupPasswordText() {
        contentView.addSubview(labelPassword)
        NSLayoutConstraint.activate([
            labelPassword.topAnchor.constraint(equalTo: txtUser.bottomAnchor, constant: 25),
            labelPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            labelPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])

        contentView.addSubview(txtPassword)
        NSLayoutConstraint.activate([
            txtPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 4),
            txtPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            txtPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            txtPassword.heightAnchor.constraint(equalToConstant: 50)
        ])

    }

    func setupForgotLabel() {
        contentView.addSubview(labelForgotPass)
        NSLayoutConstraint.activate([
            labelForgotPass.topAnchor.constraint(equalTo: txtPassword.bottomAnchor, constant: 25),
            labelForgotPass.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
        ])

        contentView.addSubview(buttonForgot)
        NSLayoutConstraint.activate([
            buttonForgot.centerYAnchor.constraint(equalTo: labelForgotPass.centerYAnchor),
            buttonForgot.leadingAnchor.constraint(equalTo: labelForgotPass.trailingAnchor, constant: 5)
        ])
    }

    func setupButtonEnter() {
        contentView.addSubview(buttonEnter)
        NSLayoutConstraint.activate([
            buttonEnter.topAnchor.constraint(equalTo: labelForgotPass.bottomAnchor, constant: size.height * 0.05),
            buttonEnter.widthAnchor.constraint(equalToConstant: size.width * 0.4),
            buttonEnter.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonEnter.heightAnchor.constraint(equalToConstant: 40)
        ])

    }

    func setupBack() {
        contentView.addSubview(imageReturn)
        NSLayoutConstraint.activate([
            imageReturn.topAnchor.constraint(equalTo: buttonEnter.bottomAnchor, constant: size.height * 0.08),
            imageReturn.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageReturn.widthAnchor.constraint(equalToConstant: 50),
            imageReturn.heightAnchor.constraint(equalToConstant: 50),
            imageReturn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        sendSubviewToBack(imageReturn)
    }
    
    func isEditing() {
        self.bottomScroll?.constant = -size.height * 0.32
    }

    func stopEditing() {
        self.bottomScroll?.constant = 0
    }

}
