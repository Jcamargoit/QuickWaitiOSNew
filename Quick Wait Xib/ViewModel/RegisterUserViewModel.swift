//
//  RegisterUserViewModel.swift
//  Quick Wait
//
//  Created by Juninho on 24/01/22.
//

import Foundation
import RxSwift
import RxRelay
import Sentry

enum RegisterViewModeStatus {
    case success, error, failed, startLoding, stopLoading, `default`
}

class RegisterUserViewModel {
    
    var status: String?
    var message: String?
    
    var antPassBack: Int = 0
    
    var disposable: DisposeBag = DisposeBag()
    
    private var model: RegisterUserModel = RegisterUserModel()
    var reportStatus: BehaviorRelay<RegisterViewModeStatus> = BehaviorRelay<RegisterViewModeStatus>(value: .default)
    
    
    var errorMessage: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    
    
    
    func setUserNameToModel(username: String) {
        self.model.setUserName(username: username)
    }
    
    func setEmailToModel(email: String) {
        self.model.setEmail(email: email)
    }
    
    func setPasswordToModel(password: String) {
        self.model.setPassword(password: password)
    }
    
    func setCpfToModel(cpf: String) {
        self.model.setCpf(cpf: cpf)
    }
    
    func setPhoneNumberToModel(phoneNumber: String) {
        self.model.setPhoneNumber(phoneNumber: phoneNumber)
    }
    
    func sendErrorTest() {
        let error = NSError(domain: "TestError", code: 12, userInfo: nil)
        SentrySDK.capture(error: error)
    }
    
    func sendFeedBackTest() {
        let eventId = SentrySDK.capture(message: "FeedBack")
        
        let userFeedback = UserFeedback(eventId: eventId)
        userFeedback.comments = "Testando FeedBack enviado por um usuario."
        userFeedback.email = "ronaldosamuel@frwk.com.br"
        userFeedback.name = "Ronaldo Samuel"
        SentrySDK.capture(userFeedback: userFeedback)
    }
    
    func verificationLoginRegister() {
        if !model.checkAllFields() {
            self.reportStatus.accept(.failed)
        } else {
            self.reportStatus.accept(.startLoding)
            self.registerUserApiCall()
        }
    }
    
    func registerUserApiCall() {
        UserClient.createUser(registerUserModel: self.model).asObservable()
            .subscribe(
                onNext: { result in
                    self.reportStatus.accept(.stopLoading)
                    if result.status != 200 {
                        self.reportStatus.accept(.error)
                        self.errorMessage.accept("\(result.message)")
                    }else {
                        self.reportStatus.accept(.success)
                        //Chamar api para logar o usuario
                        self.loginUserApiCall(user: LoginModel(user: self.model.getUserName(), password: self.model.getPassword()))
                    }
            
                },
                onError: { error in
                    self.sendErrorTest()
                    self.reportStatus.accept(.error)
                    self.reportStatus.accept(.stopLoading)
                }).disposed(by: disposable)
    }
    
    func loginUserApiCall(user: LoginModel) {
        UserClient.loginUser(loginModel: user)
            .asObservable()
            .subscribe(
                onNext: {
                    result in
                    print("Token", result.token)
                    
                    self.reportStatus.accept(.stopLoading)
                    
                    if (result.message ?? "") != ""  {
                        self.reportStatus.accept(.error)
                        self.errorMessage.accept(result.message!)
                    }else {
                        self.reportStatus.accept(.success)
                    }
                },
                onError: {
                    error in
                    print(error)
                    self.sendErrorTest()
                    self.reportStatus.accept(.stopLoading)
                    self.reportStatus.accept(.error)
                }).disposed(by: self.disposable)
    }
}
