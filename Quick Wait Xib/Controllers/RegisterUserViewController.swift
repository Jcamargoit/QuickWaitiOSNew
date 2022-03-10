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
    }
    
    
//    func criarConta()  {
//          
//          
//          self.registerUserViewModel.username = ""
//          self.registerUserViewModel.password = ""
//          self.registerUserViewModel.email = ""
//          self.registerUserViewModel.cpf = ""
//          self.registerUserViewModel.phoneNumber = ""
//          
//          self.alert = UIAlertController(title: nil, message: "Carregando...", preferredStyle: .alert)
//          let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//          loadingIndicator.hidesWhenStopped = true
//          loadingIndicator.style = UIActivityIndicatorView.Style.large
//          loadingIndicator.startAnimating();
//          self.alert.view.addSubview(loadingIndicator)
//          present(self.alert, animated: true, completion: nil)
//      
//          Webservice().load(resource: CriarConta.login(vm: self.vm)) { result in
//              
//              switch result {
//                  
//                  case .success(let order):
//                  print("conta criada com sucesso ", order?.message ?? "")
//                  DispatchQueue.main.async {
//                      self.alert.dismiss(animated: false, completion: nil)
//                  }
//                  case .failure(let error):
//                  print("erro ao criar conta ", error)
//                  DispatchQueue.main.async {
//                      self.alert.dismiss(animated: false, completion: nil)
//                  }
//                  
//              }
//          }
//      }
    
    
    
    deinit {
        print("Deinit RegisterUserViewController")
    }
}
