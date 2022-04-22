//  SettingsViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 02/03/22.

import UIKit
import RxSwift
import RxGesture

class SettingsViewController: UIViewController {

    var presentationView: SettingsView = SettingsView()
    var disposable: DisposeBag = DisposeBag()

    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }

    // O que vai ficar observando bind
    func bindView() {
        self.presentationView.imageReturn.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToReturn()
        }.disposed(by: disposable)
        self.presentationView.btnProfile.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToProfile()
        }.disposed(by: disposable)
        self.presentationView.btnHealthInsurance.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToHealthInsurance()
        }.disposed(by: disposable)
        self.presentationView.btnContactUs.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToContactUs()
        }.disposed(by: disposable)
        self.presentationView.btnDevelopers.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToDevelopers()
        }.disposed(by: disposable)
        self.presentationView.btnDeleteProfile.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToDeleteProfile()
        }.disposed(by: disposable)
        self.presentationView.btnLogout.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToLogout()
        }.disposed(by: disposable)
        self.presentationView.switchReminder.rx.controlEvent(.valueChanged)
            .withLatestFrom(self.presentationView.switchReminder.rx.value)
            .subscribe(onNext : { bool in
                self.tapToReminder()
                // esse é o valor que foi alterado ai voce pode setar esse valor no switch ou utilizar ele para fazer funções
            })
            .disposed(by: disposable)
        self.presentationView.switchNews.rx.controlEvent(.valueChanged)
            .withLatestFrom(self.presentationView.switchReminder.rx.value)
            .subscribe(onNext : { bool in
                self.tapToNews()
                // esse é o valor que foi alterado ai voce pode setar esse valor no switch ou utilizar ele para fazer funções
            })
            .disposed(by: disposable)
    }

    func tapToReturn() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    func tapToProfile () {
        let viewController = ProfileController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func tapToHealthInsurance () {
         print("Plano de saude")
    }
    func tapToContactUs() {
         print("fale Conosco")
    }
    func tapToDevelopers() {
         print("Desenvolvedores")
    }
    func tapToDeleteProfile() {
         print("Apagar perfil")
    }
    func tapToLogout() {
        doLogout()
    }
    func tapToReminder() {
         print("Notification Lembretes")
    }
    func tapToNews() {
         print("Notification Notícias")
    }
    
    
    func doLogout() {
        
        let alert = UIAlertController(title: "Sair da sua conta?", message: "Lembramos que todos seus dados serão apagados do dispositivo", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
        })
        alert.addAction(cancel)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userToken.rawValue)
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userName.rawValue)
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userMail.rawValue)
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userId.rawValue)
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userImageProfile.rawValue)
            
            let viewController = ChoiceViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        })
      
        
        
        alert.addAction(ok)
  
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
