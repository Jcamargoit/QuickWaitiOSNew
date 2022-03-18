//  RegisterUserViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 28/01/22.

import UIKit
import RxSwift
import RxGesture

class RegisterUserViewController: UIViewController {
    
    var presentationView: RegisterUserView = RegisterUserView()
    
    var disposed: DisposeBag = DisposeBag()
    private var viewModel = RegisterUserViewModel()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTap()
        bindView()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillAppear() {
        self.presentationView.isEditing()
    }

    @objc func keyboardWillDisappear() {
        self.presentationView.stopEditing()
    }
    
    //O que vai ficar observando bind
    func bindView(){
        
        self.presentationView.fieldName.text.bind { value in
            self.viewModel.setUserNameToModel(username: value)
        }.disposed(by: disposed)
        
        self.presentationView.fieldBirthDay.text.bind { value in
            
        }.disposed(by: disposed)
        
        self.presentationView.fieldPhone.text.bind { value in
            self.viewModel.setPhoneNumberToModel(phoneNumber: value)
        }.disposed(by: disposed)
        
        self.presentationView.fieldEmail.text.bind { value in
            self.viewModel.setEmailToModel(email: value)
            
        }.disposed(by: disposed)
        
        self.presentationView.fieldCPF.text.bind { value in
            self.viewModel.setCpfToModel(cpf: value)
            
        }.disposed(by: disposed)
        
        self.presentationView.fieldPassword.text.bind { value in
        
        }.disposed(by: disposed)
        
        self.presentationView.fieldConfirmPassword.text.bind { value in
            self.viewModel.setPasswordToModel(password: value)
            
        }.disposed(by: disposed)
        
        self.presentationView.imageReturn.rx.tapGesture().when(.recognized).bind { _ in self.taToBack()}.disposed(by: disposed)
        
        self.presentationView.imageNext.rx.tapGesture().when(.recognized).bind { _ in self.tapToNext()}.disposed(by: disposed)
        
        self.viewModel.reportStatus.bind { value in
            self.takeReport(report: value)
        }.disposed(by: disposed)
        
        self.viewModel.errorMessage.bind{
            texto in
            if texto != "" {
                self.simplePopUp(title: "Erro Cadastro", mensage: texto)
            }
        }.disposed(by: disposed)
    }
    
    func takeReport(report: RegisterViewModeStatus) {
        switch report {
        case .success:
            //verificação pra não abrir a tela mais de 1x
            if self.viewModel.antPassBack < 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    let vc = HomeViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                self.viewModel.antPassBack = 1
            }
       
        case .failed:
            self.simplePopUp(title: "Erro", mensage: "Favor preencher todos os dados.")
        case .startLoding:
            self.showLoading(enable: true)
        case .stopLoading:
            self.showLoading(enable: false)
        case .error:
            self.simplePopUp(title: "Erro Cadastro", mensage: "Tente novamente")
        case .default: return
        }
    }
    
    func taToBack() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func tapToNext() {
        self.viewModel.verificationLoginRegister()
    }
    
    deinit {
        print("Deinit RegisterUserViewController")
    }
}
