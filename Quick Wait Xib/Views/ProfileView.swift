//  ProfileView.swift
//  Quick Wait Xib
//  Created by Juninho on 13/04/22.

import Foundation
import UIKit

class ProfileView: UIView {
    var bottomScroll: NSLayoutConstraint?
    var scrollView: UIScrollView = {
        var scrl = UIScrollView()
        scrl.showsVerticalScrollIndicator = false
        scrl.translatesAutoresizingMaskIntoConstraints = false
        return scrl
    }()

    // Usar em scrool pra fixar na area. normalmente em vertical
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

    var imageTopBackground: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleToFill
      //  img.backgroundColor = .primaryColorBackgroundProfileTop
        img.image = UIImage(named: "")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var viewTopBackGround: UIView = {
        var view = UIView()
        view.backgroundColor = .primaryColorLabelProfile
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var blurVisualEffectView: UIVisualEffectView = {
       var blur = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        blur = UIVisualEffectView(effect: blurEffect)
        blur.alpha = 0.2
        blur.translatesAutoresizingMaskIntoConstraints = false
        return blur
      }()

    var imageReturn: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "iconBackRegister")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var imageUser: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "userPhoto")
        img.layer.cornerRadius = 64
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var imageUserAdd: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "upPhoto")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var labelNameAndSurname: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Nome e Sobrenome"
        lbl.font = .primaryFontBoldLargerTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var labelDateOfBirth: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "30/12/1994"
        lbl.font = .primaryFontRegularMediumTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var imageUserPhone: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "phone")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var labelUserPhone: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "+55 (11)9999-9999"
        lbl.font = .primaryFontBoldMediumTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var imageUserMail: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "mail")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var labelUserMail: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "user@user.com.br"
        lbl.font = .primaryFontBoldMediumTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var imageUserLocation: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "locationProfile")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var labelUserLocation: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "São Paulo - Barueri"
        lbl.font = .primaryFontBoldMediumTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var imageRecoverPassword: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "recoverPassword")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var labelRecoverPassword: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .primaryColorLabelProfile
        lbl.text = "Alterar senha"
        lbl.font = .primaryFontRegularMediumTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var imageHealthInsurance: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "healthInsurance")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var labelHealthInsurance: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .primaryColorLabelProfile
        lbl.text = "Plano de saúde"
        lbl.font = .primaryFontRegularMediumTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var labelTest: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Unimed BH"
        lbl.font = .primaryFontRegularMediumTow
        lbl.backgroundColor = .primaryColorLabelProfile
        lbl.layer.cornerRadius = 10
        lbl.clipsToBounds = true
        lbl.textAlignment = NSTextAlignment.center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()


    var imageLogout: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "logout")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var labelLogout: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .primaryColorLabelProfile
        lbl.text = "Finalizar sessão"
        lbl.font = .primaryFontRegularMediumTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var imageDeleteAccount: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "deleteAccount")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var labelDeleteAccount: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .red
        lbl.text = "Apagar conta"
        lbl.font = .primaryFontRegularMediumTow
        lbl.textAlignment = NSTextAlignment.left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        backgroundColor = .white
        setupScroll()
        setupStack()
        setupContentView()
        setupTopBackGround()
        setupTopImageBackGround()
        setupblurVisualEffectView()
        setupReturn()
        setupUserImage()
        setupUserImageAdd()
        setupUserNameAndSurname()
        setupUserDateOfBirth()
        setupUserPhoneImage()
        setupUserPhoneLabel()
        setupUserMailImage()
        setupUserMailLabel()
        setupUserLocationImage()
        setupUserLocationLabel()
        setupRecoverPasswordImage()
        setupRecoverPasswordLabel()
        setupHealthInsuranceImage()
        setupHealthInsuranceLabel()
        setupTest()
        setupLogoutImage()
        setupLogoutLabel()
        setupDeleteAccountImage()
        setupDeleteAccountLabel()
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

    func setupTopImageBackGround() {
        viewTopBackGround.addSubview(imageTopBackground)
        NSLayoutConstraint.activate([
            imageTopBackground.topAnchor.constraint(equalTo: topAnchor),
            imageTopBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageTopBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageTopBackground.heightAnchor.constraint(equalToConstant: 440)
           
        ])
    }
    
    func setupTopBackGround() {
        contentView.addSubview(viewTopBackGround)
        NSLayoutConstraint.activate([
            viewTopBackGround.topAnchor.constraint(equalTo: topAnchor),
            viewTopBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewTopBackGround.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupblurVisualEffectView() {
        viewTopBackGround.addSubview(blurVisualEffectView)
        NSLayoutConstraint.activate([
            blurVisualEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurVisualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurVisualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurVisualEffectView.heightAnchor.constraint(equalToConstant: 440)
           
        ])
    }
    
    func setupReturn() {
        addSubview(imageReturn)
        NSLayoutConstraint.activate([
            imageReturn.topAnchor.constraint(equalTo: viewTopBackGround.topAnchor, constant: 50),
            imageReturn.leadingAnchor.constraint(equalTo: viewTopBackGround.leadingAnchor, constant: 20),
            imageReturn.widthAnchor.constraint(equalToConstant: 38),
            imageReturn.heightAnchor.constraint(equalToConstant: 38)
        ])
    }

    func setupUserImage() {
        viewTopBackGround.addSubview(imageUser)
        NSLayoutConstraint.activate([
            imageUser.topAnchor.constraint(equalTo: imageReturn.bottomAnchor, constant: 10),
            imageUser.leadingAnchor.constraint(equalTo: imageReturn.leadingAnchor, constant: 20),
            imageUser.widthAnchor.constraint(equalToConstant: 128),
            imageUser.heightAnchor.constraint(equalToConstant: 128)
        ])
    }
    
    func setupUserImageAdd() {
        viewTopBackGround.addSubview(imageUserAdd)
        NSLayoutConstraint.activate([
            imageUserAdd.bottomAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 7),
            imageUserAdd.trailingAnchor.constraint(equalTo: imageUser.trailingAnchor),
            imageUserAdd.widthAnchor.constraint(equalToConstant: 20),
            imageUserAdd.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    func setupUserNameAndSurname() {
        viewTopBackGround.addSubview(labelNameAndSurname)
        NSLayoutConstraint.activate([
            labelNameAndSurname.topAnchor.constraint(equalTo: imageUserAdd.bottomAnchor, constant: 15),
            labelNameAndSurname.leadingAnchor.constraint(equalTo: imageUser.leadingAnchor),
            labelNameAndSurname.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }

    func setupUserDateOfBirth() {
        viewTopBackGround.addSubview(labelDateOfBirth)
        NSLayoutConstraint.activate([
            labelDateOfBirth.topAnchor.constraint(equalTo: labelNameAndSurname.bottomAnchor, constant: 5),
            labelDateOfBirth.leadingAnchor.constraint(equalTo: labelNameAndSurname.leadingAnchor),
            labelDateOfBirth.trailingAnchor.constraint(equalTo: labelNameAndSurname.trailingAnchor)
        ])
    }

    func setupUserPhoneImage() {
        viewTopBackGround.addSubview(imageUserPhone)
        NSLayoutConstraint.activate([
            imageUserPhone.topAnchor.constraint(equalTo: labelDateOfBirth.bottomAnchor, constant: 30),
            imageUserPhone.leadingAnchor.constraint(equalTo: labelDateOfBirth.leadingAnchor),
            imageUserPhone.widthAnchor.constraint(equalToConstant: 24),
            imageUserPhone.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func setupUserPhoneLabel() {
        viewTopBackGround.addSubview(labelUserPhone)
        NSLayoutConstraint.activate([
            labelUserPhone.centerYAnchor.constraint(equalTo: imageUserPhone.centerYAnchor),
            labelUserPhone.leadingAnchor.constraint(equalTo: imageUserPhone.trailingAnchor, constant: 10),
            labelUserPhone.trailingAnchor.constraint(equalTo: labelDateOfBirth.trailingAnchor)
        ])
    }

    func setupUserMailImage() {
        viewTopBackGround.addSubview(imageUserMail)
        NSLayoutConstraint.activate([
            imageUserMail.topAnchor.constraint(equalTo: imageUserPhone.bottomAnchor, constant: 10),
            imageUserMail.centerXAnchor.constraint(equalTo: imageUserPhone.centerXAnchor),
            imageUserMail.widthAnchor.constraint(equalToConstant: 24),
            imageUserMail.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func setupUserMailLabel() {
        viewTopBackGround.addSubview(labelUserMail)
        NSLayoutConstraint.activate([
            labelUserMail.centerYAnchor.constraint(equalTo: imageUserMail.centerYAnchor),
            labelUserMail.leadingAnchor.constraint(equalTo: imageUserMail.trailingAnchor, constant: 10),
            labelUserMail.trailingAnchor.constraint(equalTo: labelUserPhone.trailingAnchor)
        ])
    }

    func setupUserLocationImage() {
        viewTopBackGround.addSubview(imageUserLocation)
        NSLayoutConstraint.activate([
            imageUserLocation.topAnchor.constraint(equalTo: imageUserMail.bottomAnchor, constant: 10),
            imageUserLocation.centerXAnchor.constraint(equalTo: imageUserMail.centerXAnchor),
            imageUserLocation.widthAnchor.constraint(equalToConstant: 18),
            imageUserLocation.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    func setupUserLocationLabel() {
        viewTopBackGround.addSubview(labelUserLocation)
        NSLayoutConstraint.activate([
            labelUserLocation.centerYAnchor.constraint(equalTo: imageUserLocation.centerYAnchor),
            labelUserLocation.leadingAnchor.constraint(equalTo: imageUserLocation.trailingAnchor, constant: 10),
            labelUserLocation.trailingAnchor.constraint(equalTo: labelUserMail.trailingAnchor),
            labelUserLocation.bottomAnchor.constraint(equalTo: viewTopBackGround.bottomAnchor, constant: -30)
        ])
    }

    func setupRecoverPasswordImage() {
        addSubview(imageRecoverPassword)
        NSLayoutConstraint.activate([
            imageRecoverPassword.topAnchor.constraint(equalTo: imageUserLocation.bottomAnchor, constant: 50),
            imageRecoverPassword.centerXAnchor.constraint(equalTo: imageUserLocation.centerXAnchor),
            imageRecoverPassword.widthAnchor.constraint(equalToConstant: 24),
            imageRecoverPassword.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    func setupRecoverPasswordLabel() {
        addSubview(labelRecoverPassword)
        NSLayoutConstraint.activate([
            labelRecoverPassword.centerYAnchor.constraint(equalTo: imageRecoverPassword.centerYAnchor),
            labelRecoverPassword.leadingAnchor.constraint(equalTo: imageRecoverPassword.trailingAnchor, constant: 10),
            labelRecoverPassword.trailingAnchor.constraint(equalTo: labelUserLocation.trailingAnchor)
        ])
    }

    func setupHealthInsuranceImage() {
        addSubview(imageHealthInsurance)
        NSLayoutConstraint.activate([
            imageHealthInsurance.topAnchor.constraint(equalTo: imageRecoverPassword.bottomAnchor, constant: 30),
            imageHealthInsurance.centerXAnchor.constraint(equalTo: imageRecoverPassword.centerXAnchor),
            imageHealthInsurance.widthAnchor.constraint(equalToConstant: 23),
            imageHealthInsurance.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    func setupHealthInsuranceLabel() {
        addSubview(labelHealthInsurance)
        NSLayoutConstraint.activate([
            labelHealthInsurance.centerYAnchor.constraint(equalTo: imageHealthInsurance.centerYAnchor),
            labelHealthInsurance.leadingAnchor.constraint(equalTo: imageHealthInsurance.trailingAnchor, constant: 10),
            labelHealthInsurance.trailingAnchor.constraint(equalTo: labelRecoverPassword.trailingAnchor)
        ])
    }

    func setupTest() {
        addSubview(labelTest)
        NSLayoutConstraint.activate([
            labelTest.topAnchor.constraint(equalTo: labelHealthInsurance.bottomAnchor, constant: 20),
            labelTest.leadingAnchor.constraint(equalTo: labelHealthInsurance.leadingAnchor),
            labelTest.heightAnchor.constraint(equalToConstant: 35),
            labelTest.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setupLogoutImage() {
        addSubview(imageLogout)
        NSLayoutConstraint.activate([
            imageLogout.topAnchor.constraint(equalTo: labelTest.bottomAnchor, constant: 30),
            imageLogout.centerXAnchor.constraint(equalTo: imageHealthInsurance.centerXAnchor),
            imageLogout.widthAnchor.constraint(equalToConstant: 30),
            imageLogout.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    func setupLogoutLabel() {
        addSubview(labelLogout)
        NSLayoutConstraint.activate([
            labelLogout.centerYAnchor.constraint(equalTo: imageLogout.centerYAnchor),
            labelLogout.leadingAnchor.constraint(equalTo: imageLogout.trailingAnchor, constant: 10),
            labelLogout.trailingAnchor.constraint(equalTo: labelHealthInsurance.trailingAnchor)
        ])
    }

    func setupDeleteAccountImage() {
        addSubview(imageDeleteAccount)
        NSLayoutConstraint.activate([
            imageDeleteAccount.topAnchor.constraint(equalTo: imageLogout.bottomAnchor, constant: 30),
            imageDeleteAccount.centerXAnchor.constraint(equalTo: imageLogout.centerXAnchor),
            imageDeleteAccount.widthAnchor.constraint(equalToConstant: 30),
            imageDeleteAccount.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    func setupDeleteAccountLabel() {
        addSubview(labelDeleteAccount)
        NSLayoutConstraint.activate([
            labelDeleteAccount.centerYAnchor.constraint(equalTo: imageDeleteAccount.centerYAnchor),
            labelDeleteAccount.leadingAnchor.constraint(equalTo: imageDeleteAccount.trailingAnchor, constant: 10),
            labelDeleteAccount.trailingAnchor.constraint(equalTo: labelLogout.trailingAnchor),
            labelDeleteAccount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }

    func isEditing () {
        self.bottomScroll?.constant = -size.height * 0.32
    }

    func stopEditing () {
        self.bottomScroll?.constant = 0
    }
}
