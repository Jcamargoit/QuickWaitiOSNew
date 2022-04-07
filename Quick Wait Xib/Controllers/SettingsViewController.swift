//
//  SettingsViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 02/03/22.
//

import UIKit
import RxSwift
import RxGesture

class SettingsViewController: UIViewController {

    //@IBOutlet weak var mynameisjo: UIScrollView!
    
    var presentationView: SettingsView = SettingsView()
    var disposable: DisposeBag = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillAppear() {
        self.presentationView.isEditing()
    }

    @objc func keyboardWillDisappear() {
        self.presentationView.stopEditing()
    }

//    @IBAction func tapToback(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
//    }
    
    
    
}
