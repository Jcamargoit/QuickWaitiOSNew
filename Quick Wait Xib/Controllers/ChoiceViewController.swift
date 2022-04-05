//
//  ChoiceViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 27/01/22.
//

import UIKit
import Sentry
import RxSwift
import RxGesture

class ChoiceViewController: UIViewController {

    private var choiceViewModel = ChoiceViewModel()
    var presentationView: ChoiceView = ChoiceView()
    var disposable: DisposeBag = DisposeBag()

    override func loadView() {
        view = presentationView
    }

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

        bindView()

    }

    func bindView() {

        self.presentationView.googleButton.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToLoginWithGoogle()
        }.disposed(by: disposable)

        self.presentationView.facebookButton.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToLoginWithFacebook()
        }.disposed(by: disposable)

        self.presentationView.btnEnter.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToLogin()
        }.disposed(by: disposable)

        self.presentationView.btnSigin.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToRegister()
        }.disposed(by: disposable)

        self.presentationView.btnGuest.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToLoginAsGuest()
        }.disposed(by: disposable)
    }

    func tapToLoginWithGoogle() {
    }

    func tapToLoginWithFacebook() {
    }

    func tapToLogin() {
        let viewController = LoginViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func tapToRegister() {
        let viewController = RegisterUserViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func tapToLoginAsGuest() {
        let viewController = HomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    deinit {
        print("Deinit ChoiceViewController")
    }
}
