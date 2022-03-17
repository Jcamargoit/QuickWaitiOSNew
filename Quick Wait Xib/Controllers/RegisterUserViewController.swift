//  RegisterUserViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 28/01/22.

import UIKit
import RxSwift
import RxGesture

class RegisterUserViewController: UIViewController {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfBirthDate: UITextField!
    @IBOutlet weak var tfCell: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfCPF: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    var disposed: DisposeBag = DisposeBag()
    private var viewModel = RegisterUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTap()
        bindView()
    }
    
    @IBAction func taToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapToNext(_ sender: UIButton) {
        self.setValueToModel()
        self.viewModel.verificationLoginRegister()
    }
    
    func setValueToModel() {
        self.viewModel.setUserNameToModel(username: self.tfName.text ?? "")
        self.viewModel.setCpfToModel(cpf: self.tfCPF.text ?? "")
        self.viewModel.setEmailToModel(email: self.tfEmail.text ?? "")
        self.viewModel.setPasswordToModel(password: self.tfPassword.text ?? "")
        self.viewModel.setPhoneNumberToModel(phoneNumber: self.tfName.text ?? "")
    }
    
    //O que vai ficar observando bind
    func bindView(){
        self.viewModel.reportStatus.bind { value in self.takeReport(report: value)}.disposed(by: disposed)
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
    
    
    deinit {
        print("Deinit RegisterUserViewController")
    }
}
