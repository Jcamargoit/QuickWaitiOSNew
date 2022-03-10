//
//  ChoiceViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 27/01/22.
//

import UIKit
import Sentry

class ChoiceViewController: UIViewController {
    
    private var choiceViewModel = ChoiceViewModel()
    
    var teste: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Transaction can be started by providing, at minimum, the name and the operation
        let transaction = SentrySDK.startTransaction(name: "Update Repos", operation: "db")
        // Transactions can have child spans (and those spans can have child spans as well)
        let span = transaction.startChild(operation: "db", description: "Update first repo")

        // ...
        // (Perform the operation represented by the span/transaction)
        // ...

        span.finish() // Mark the span as finished
        transaction.finish()
        

    }
    
    
    @IBAction func tapToLoginWithGoogle(_ sender: UIButton) {
    }
    
    @IBAction func tapToLoginWithFacebook(_ sender: UIButton) {
    }
    
    @IBAction func tapToLogin(_ sender: UIButton) {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapToRegister(_ sender: UIButton) {
        let vc = RegisterUserViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapToLoginAsGuest(_ sender: UIButton) {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("Deinit ChoiceViewController")
    }
}
