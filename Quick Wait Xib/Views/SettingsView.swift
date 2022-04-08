//
//  SettingsView.swift
//  Quick Wait Xib
//
//  Created by Juninho on 05/04/22.
//

import Foundation
import UIKit

class SettingsView : UIView {
    
    var bottomScroll : NSLayoutConstraint?
    
    var scrollView : UIScrollView = {
        var scrl = UIScrollView ()
        scrl.showsVerticalScrollIndicator = false
        scrl.translatesAutoresizingMaskIntoConstraints = false
        return scrl
    }()
    
    //Usar em scrool pra fixar na area. normalmente em vertical
    var stackSigin : UIStackView = {
            var stk = UIStackView ()
            stk.axis = .vertical
            stk.translatesAutoresizingMaskIntoConstraints = false
            return stk
        }()
    
    
    var contentView : UIView = {
        var view = UIView ()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageReturn : UIImageView = {
       var img = UIImageView ()
        img.image = UIImage (named : "iconBackRegister")?.withRenderingMode (.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var iconSettings : UIImageView = {
       var img = UIImageView ()
        img.image = UIImage (named : .iconSettings)?.withRenderingMode (.alwaysOriginal)
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    

    
    var labelSettings : UILabel = {
       var lbl = UILabel ()
        lbl.textColor = .black
        lbl.text = "CONFIGURAÇÕES"
        lbl.font = UIFont.init (name : "Quicksand_Book", size: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var btnProfile : CustomButtonView = {
       var btn = CustomButtonView ()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont (value : .medium)
        btn.setButtonTitle (text : "PERFIL")
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    var btnHealthInsurance : CustomButtonView = {
       var btn = CustomButtonView ()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value : .medium)
        btn.setButtonTitle(text : "PLANO DE SAÚDE")
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    var btnContactUs : CustomButtonView = {
       var btn = CustomButtonView ()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value : .medium)
        btn.setButtonTitle(text : "FALE CONOSCO")
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    var btnDevelopers : CustomButtonView = {
       var btn = CustomButtonView ()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value : .medium)
        btn.setButtonTitle(text : "DESENVOLVEDORES")
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    var btnDeleteProfile : CustomButtonView = {
       var btn = CustomButtonView ()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value : .medium)
        btn.setButtonTitle(text : "APAGAR PERFIL")
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    var btnLogout : CustomButtonView = {
       var btn = CustomButtonView ()
        btn.contentView.layer.cornerRadius = 14.5
        btn.setupBoldFont(value : .medium)
        btn.setButtonTitle(text : "SAIR")
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    var labelReminderNotification : UILabel = {
       var lbl = UILabel ()
        lbl.textColor = UIColor(red : (72/255), green : (161/255), blue : (167/255), alpha : 1.00)
        lbl.text = "Notificações de lembretes"
        lbl.font = UIFont.init (name : "Quicksand_Book", size: 30)
        lbl.textAlignment = NSTextAlignment.center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var labelTest : UILabel = {
       var lbl = UILabel ()
        lbl.textColor = UIColor(red : (72/255), green : (161/255), blue : (167/255), alpha : 1.00)
        lbl.text = "🤣"
        lbl.font = UIFont.init (name : "Quicksand_Book", size: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()


    
    override init (frame : CGRect) {
        super.init (frame : frame)
        createSubviews ()
    }
    
    required init? (coder : NSCoder) {
        super.init (coder : coder)
        createSubviews ()
    }
    
    func createSubviews () {
        
        backgroundColor = UIColor(red : 0.87, green : 1.00, blue : 1.00, alpha : 1.00)
        
        setupScroll ()
        setupStack ()
        setupContentView ()
        setupBack ()
        setupProfileButton ()
        setupHealthInsuranceButton ()
        setupContactUsButton ()
        setupDevelopersButton ()
        setupDeleteProfileButton ()
        setupLogoutButton ()
        setupReminderNotificationLabel ()
        setupTestLabel ()
        
    }
    
    func setupScroll () {
        
        bottomScroll = scrollView.bottomAnchor.constraint (equalTo : bottomAnchor, constant: 0)
        
        addSubview (scrollView)
               NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                bottomScroll!,
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
               ])
    }
    
    func setupStack () {
        scrollView.addSubview (stackSigin)
        NSLayoutConstraint.activate([
            stackSigin.topAnchor.constraint (equalTo : scrollView.topAnchor),
            stackSigin.bottomAnchor.constraint (equalTo : scrollView.bottomAnchor),
            stackSigin.leadingAnchor.constraint (equalTo : scrollView.leadingAnchor),
            stackSigin.trailingAnchor.constraint (equalTo : scrollView.trailingAnchor),
            stackSigin.widthAnchor.constraint(equalToConstant : size.width)
        ])
    }
    
    func setupBack () {
        contentView.addSubview (imageReturn)
        NSLayoutConstraint.activate([
            imageReturn.topAnchor.constraint (equalTo : contentView.topAnchor, constant: 20),
            imageReturn.leadingAnchor.constraint (equalTo : contentView.leadingAnchor, constant: 20),
            imageReturn.widthAnchor.constraint (equalToConstant : 35),
            imageReturn.heightAnchor.constraint (equalToConstant : 35),

        ])
        
        //Quando quero deixar meu componente por trás independente da ordem que esteja.
      //  contentView.sendSubviewToBack(imageReturn)
    }
    
    func setupContentView () {
        stackSigin.addArrangedSubview (contentView)
        
        contentView.addSubview (iconSettings)
        NSLayoutConstraint.activate([
            iconSettings.centerXAnchor.constraint (equalTo : centerXAnchor),
            iconSettings.topAnchor.constraint (equalTo : contentView.topAnchor, constant: 75),
            iconSettings.widthAnchor.constraint (equalToConstant : 110),
            iconSettings.heightAnchor.constraint (equalToConstant : 110),
        ])
        
        
        contentView.addSubview (labelSettings)
        NSLayoutConstraint.activate ([
            labelSettings.centerXAnchor.constraint (equalTo : iconSettings.centerXAnchor),
            labelSettings.topAnchor.constraint (equalTo : iconSettings.bottomAnchor, constant: 20),
        ])
    }
    
    func setupProfileButton () {
        contentView.addSubview (btnProfile)
        NSLayoutConstraint.activate([
            btnProfile.centerXAnchor.constraint (equalTo : labelSettings.centerXAnchor),
            btnProfile.topAnchor.constraint (equalTo : labelSettings.bottomAnchor, constant: 20),
            btnProfile.widthAnchor.constraint (equalToConstant : 300),
            btnProfile.heightAnchor.constraint (equalToConstant : 40),
        ])
    }
    
    
    func setupHealthInsuranceButton () {
        contentView.addSubview (btnHealthInsurance)
        NSLayoutConstraint.activate([
            btnHealthInsurance.centerXAnchor.constraint (equalTo : btnProfile.centerXAnchor),
            btnHealthInsurance.topAnchor.constraint (equalTo : btnProfile.bottomAnchor, constant: 20),
            btnHealthInsurance.widthAnchor.constraint (equalToConstant : 300),
            btnHealthInsurance.heightAnchor.constraint (equalToConstant : 40),
        ])
    }
    
    func setupContactUsButton () {
        contentView.addSubview(btnContactUs)
        NSLayoutConstraint.activate([
            btnContactUs.centerXAnchor.constraint(equalTo: btnHealthInsurance.centerXAnchor),
            btnContactUs.topAnchor.constraint(equalTo: btnHealthInsurance.bottomAnchor, constant: 20),
            btnContactUs.widthAnchor.constraint(equalToConstant: 300),
            btnContactUs.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func setupDevelopersButton () {
        contentView.addSubview(btnDevelopers)
        NSLayoutConstraint.activate([
            btnDevelopers.centerXAnchor.constraint (equalTo : btnContactUs.centerXAnchor),
            btnDevelopers.topAnchor.constraint (equalTo : btnContactUs.bottomAnchor, constant: 20),
            btnDevelopers.widthAnchor.constraint (equalToConstant : 300),
            btnDevelopers.heightAnchor.constraint (equalToConstant : 40),
        ])
    }
    
    func setupDeleteProfileButton () {
        contentView.addSubview (btnDeleteProfile)
        NSLayoutConstraint.activate([
            btnDeleteProfile.centerXAnchor.constraint (equalTo : btnDevelopers.centerXAnchor),
            btnDeleteProfile.topAnchor.constraint (equalTo : btnDevelopers.bottomAnchor, constant: 20),
            btnDeleteProfile.widthAnchor.constraint (equalToConstant : 300),
            btnDeleteProfile.heightAnchor.constraint (equalToConstant : 40),
        ])
    }
    
    func setupLogoutButton () {
        contentView.addSubview (btnLogout)
        NSLayoutConstraint.activate([
            btnLogout.centerXAnchor.constraint (equalTo : btnDeleteProfile.centerXAnchor),
            btnLogout.topAnchor.constraint (equalTo : btnDeleteProfile.bottomAnchor, constant: 20),
            btnLogout.widthAnchor.constraint (equalToConstant : 300),
            btnLogout.heightAnchor.constraint (equalToConstant : 40),
        ])
    }
    
    func setupReminderNotificationLabel () {
        contentView.addSubview (labelReminderNotification)
        NSLayoutConstraint.activate([
            labelReminderNotification.topAnchor.constraint (equalTo : btnLogout.bottomAnchor, constant: 20),
            labelReminderNotification.leadingAnchor.constraint (equalTo : btnLogout.leadingAnchor),
            labelReminderNotification.trailingAnchor.constraint (equalTo : btnLogout.trailingAnchor),
        ])
    }
    
    
    func setupTestLabel () {
        contentView.addSubview (labelTest)
        NSLayoutConstraint.activate([
            labelTest.leadingAnchor.constraint (equalTo : labelReminderNotification.trailingAnchor),
            labelTest.centerYAnchor.constraint (equalTo : labelReminderNotification.centerYAnchor),
        ])
    }
    
    
    

    func isEditing () {
        self.bottomScroll?.constant = -size.height * 0.32
    }
    
    func stopEditing () {
        self.bottomScroll?.constant = 0
    }
    
}
