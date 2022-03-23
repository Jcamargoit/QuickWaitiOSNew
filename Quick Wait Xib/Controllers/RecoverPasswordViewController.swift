//  RecoverPasswordViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 27/01/22.

import UIKit
import RxSwift

class RecoverPasswordViewController: UIViewController {
    
    private var presentationView: RecoverPasswordView = RecoverPasswordView()
    private var viewModel: RecoverPasswordViewModel = RecoverPasswordViewModel()
    private var disposed: DisposeBag = DisposeBag()
    
    @IBOutlet weak var tfRecoverPassword: UITextField!
    
    override func loadView() {
        
        view = self.presentationView
        self.presentationView.setupView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardOnTap()
        
        bindView()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            self.presentationView.scrollView.contentInset = .zero
        } else {
            self.presentationView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        self.presentationView.scrollView.scrollIndicatorInsets = self.presentationView.scrollView.contentInset

    }
    
    private func bindView() {

        self.presentationView.btnBack.rx.tapGesture().when(.recognized)
            .bind { [weak self] _ in // [weak self] in closure to avoid leak memory
                self?.back()
            }.disposed(by: self.disposed)
        
        self.presentationView.nextButton.rx.tapGesture().when(.recognized)
            .bind { [weak self] _ in // [weak self] in closure to avoid leak memory
                self?.nextStep()
            }.disposed(by: self.disposed)
    }
    
    private func back() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func nextStep() {
        let vc = RecoverPasswordResultViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func topToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func taToNext(_ sender: UIButton) {
        //Funciona
        let vc = RecoverPasswordResultViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("Deinit RecoverPasswordViewController")
    }
}

