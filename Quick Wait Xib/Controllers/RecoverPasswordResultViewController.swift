//
//  RecoverPasswordResultViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 27/01/22.
//

import UIKit

class RecoverPasswordResultViewController: UIViewController {
    
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfConfirmNewPassword: UITextField!
    
    // private var recoverPasswordResultViewModel = RecoverPasswordResultViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTap()
    }
    
    @IBAction func taToSend(_ sender: UIButton) {
    }
    
    @IBAction func taTopBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("Deinit RecoverPasswordResultViewController")
    }
}
