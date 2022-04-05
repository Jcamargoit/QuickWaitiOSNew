//  RecoverPasswordViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 27/01/22.

import UIKit

class RecoverPasswordViewController: UIViewController {

    @IBOutlet weak var tfRecoverPassword: UITextField!

    private var recoverPasswordViewModel = RecoverPasswordViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTap()
    }

    @IBAction func topToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func taToNext(_ sender: UIButton) {
        // Funciona
        let viewController = RecoverPasswordResultViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    deinit {
        print("Deinit RecoverPasswordViewController")
    }
}
