//  RegisterUserViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 28/01/22.

import UIKit

class RegisterUserViewController: UIViewController {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfBirthDate: UITextField!
    @IBOutlet weak var tfCell: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfCPF: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    private var registerUserViewModel = RegisterUserViewModel()
    var alert = UIAlertController ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTap()
    }
    
    @IBAction func taToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapToNext(_ sender: UIButton) {
        createAnAccount()
    }
    
    func createAnAccount()  {
        
        self.registerUserViewModel.username = self.tfName.text ?? ""
        self.registerUserViewModel.password = self.tfPassword.text ?? ""
        self.registerUserViewModel.email = self.tfEmail.text ?? ""
        self.registerUserViewModel.cpf = self.tfCPF.text ?? ""
        self.registerUserViewModel.phoneNumber = self.tfCell.text ?? ""
        
        showLoading(enable: true)
        
        APIService().load(resource: RegisterUserModel.addNewUser(vm: self.registerUserViewModel)) { result in
            
            switch result {
                
            case .success(let order):
                print("conta criada com sucesso ", order?.message ?? "")
                DispatchQueue.main.async {
                    self.showLoading(enable: false)
                    self.simplePopUp(title: "Cadastro", mensage: "Efetuado com sucesso")
                }
            case .failure(let error):
                print("erro ao criar conta ", error)
                DispatchQueue.main.async {
                    self.showLoading(enable: false)
                    self.simplePopUp(title: "Cadastro", mensage: "Não efetuado, tentar novamente")
                }
            }
        }
    }
    
    deinit {
        print("Deinit RegisterUserViewController")
    }
}
