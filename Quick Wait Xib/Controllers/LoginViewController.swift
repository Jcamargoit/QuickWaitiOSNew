//
//  LoginViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 27/01/22.
//

import UIKit
import Sentry

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfUser: UITextField!{
        didSet{
            self.tfUser.delegate = self
        }
    }
    @IBOutlet weak var tfPassword: UITextField!{
        didSet{
            self.tfPassword.delegate = self
        }
    }
    
    var numeros = Int ()
    var verificacao = String ()
    var user: String = "framework"
    var password: String = "frame"
    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func taToRecoverPassword(_ sender: UIButton) {
        let vc = RecoverPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapToLogin(_ sender: UIButton) {
        verificationLogin()
    }
    
    @IBAction func tapToback(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func verificationLogin(){
        
        let eventId = SentrySDK.capture(message: "FeedBack")

        let userFeedback = UserFeedback(eventId: eventId)
        userFeedback.comments = "Testando FeedBack enviado por um usuario."
        userFeedback.email = "ronaldosamuel@frwk.com.br"
        userFeedback.name = "Ronaldo Samuel"
        SentrySDK.capture(userFeedback: userFeedback)
        
        if tfUser.text!.isEmpty {
            let error = NSError(domain: "LoginError", code: 12, userInfo: nil)
            SentrySDK.capture(error: error)
            simplePopUp(title: "", mensage: "É necessário digitar o usuário")
        } else  if tfPassword.text!.isEmpty{
            simplePopUp(title: "", mensage: "É necessário digitar a senha")
        } else {
            showLoading(enable: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showLoading(enable: false)
                
                if self.tfUser.text ?? "" == self.user || self.tfPassword.text ?? "" == self.password {
                    let vc = HomeViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    self.simplePopUp(title: "Dados de log in inválido", mensage: "tente novamente")
                }
            }
        }
    }
    
    deinit {
        print("Deinit LoginViewController")
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //METODO PARA DAR FOCO EM UMA TEXFILD ESPECIFA
        self.tfPassword.becomeFirstResponder()
        return false
    }
}
