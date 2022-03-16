//
//  LoginViewModel.swift
//  Quick Wait
//
//  Created by Juninho on 24/01/22.
//

import Foundation
import RxSwift
import RxRelay
import Sentry

enum LoginViewModeStatus {
    case success, error, failed, startLoding, stopLoading, `default`
}

class LoginViewModel {
    var token: String?
    var type: String?
    var id: String?
    var email: String?
    
    var disposable: DisposeBag = DisposeBag()
    
    private var model: LoginModel = LoginModel()
    var reportStatus: BehaviorRelay<LoginViewModeStatus> = BehaviorRelay<LoginViewModeStatus>(value: .default)
    
    func setUserToModel(user: String) {
        self.model.setUser(user: user)
    }
    
    func setPasswordToModel(password: String) {
        self.model.setPassword(password: password)
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
    
    func verificationLogin(){
        if !model.checkAllFields() {
            self.reportStatus.accept(.failed)
        } else {
            self.reportStatus.accept(.startLoding)
            
            UserClient.loginUser(loginModel: self.model).asObservable()
                .subscribe(
                    onNext: { result in
                        print(result.email)
                        self.reportStatus.accept(.success)
                        self.reportStatus.accept(.stopLoading)
                    },
                    onError: { error in
                        self.sendErrorTest()
                        self.reportStatus.accept(.error)
                        self.reportStatus.accept(.stopLoading)
                    }).disposed(by: disposable)
            
            UserClient.createUser(name: "adas", email: "asdasda").asObservable().subscribe(onNext: {
                result in
                print(result.mensagem)
            }, onError: {
                error in
                print(error)
            }
            
        }
    }
    
}
