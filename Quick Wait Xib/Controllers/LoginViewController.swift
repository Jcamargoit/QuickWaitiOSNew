//
//  LoginViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 27/01/22.
//

import UIKit
import RxSwift
import RxGesture

class LoginViewController: UIViewController {
    var presentationView: LoginView = LoginView()
    var disposed: DisposeBag = DisposeBag()
    private var viewModel = LoginViewModel()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
        
        self.presentationView.txtUser.rx.text.bind { value in
            self.viewModel.setUserToModel(user: value ?? "")
        }.disposed(by: disposed)
        
        self.presentationView.txtPassword.rx.text.bind { value in
            self.viewModel.setPasswordToModel(password: value ?? "")
        }.disposed(by: disposed)
        
        self.presentationView.buttonForgot.rx.tap.bind { _ in
                self.taToRecoverPassword()
        }.disposed(by: disposed)
        
        self.presentationView.buttonEnter.rx.tap.bind { _ in
            self.viewModel.verificationLogin()
        }.disposed(by: disposed)
        
        self.presentationView.imageReturn.rx
            .tapGesture()
            .when(.recognized)
            .bind { _ in
                self.tapToback()
            }.disposed(by: disposed)
        
        self.viewModel.reportStatus.bind { value in self.takeReport(report: value)}.disposed(by: disposed)
        
           // .bin ficar se observando
        self.viewModel.errorMessage.bind {
            value in
            if value != "" {
                    self.simplePopUp(title: "Erro Log in", mensage: value)
            }
        }
        
    }
    
    func takeReport(report: LoginViewModeStatus) {
        switch report {
        case .success:
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let vc = HomeViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case .failed:
            self.simplePopUp(title: "Erro", mensage: "Favor preencher todos os dados.")
        case .startLoding:
            self.showLoading(enable: true)
        case .stopLoading:
            self.showLoading(enable: false)
        case .error:
            self.simplePopUp(title: "Erro", mensage: "Usuario ou senha invalidos.")
        case .default: return
        }
    }
    
    func taToRecoverPassword() {
        let vc = RecoverPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tapToback() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
