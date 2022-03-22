//  NewsViewModel.swift
//  Quick Wait Xib
//  Created by Juninho on 18/02/22.

import Foundation
import RxSwift
import RxRelay
import Sentry

enum NewsViewModeStatus {
    case success, error, failed, startLoding, stopLoading, `default`
}

//: AnyObject funciona para poder usar a variável como weak pra ter uma referencia fraca.
protocol refreshNews: AnyObject {
    func reload()
    func error()
}

class NewsViewModel {
    
    weak var delegate: refreshNews?
    
    var disposable: DisposeBag = DisposeBag()
    
    private var model: NewsModel = NewsModel()
    var reportStatus: BehaviorRelay<NewsViewModeStatus> = BehaviorRelay<NewsViewModeStatus>(value: .default)
    
    
    var errorMessage: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var modelResult: NewsResultCodable?
    
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
    
    func setup(){
        
        NewsClient.getNews().asObservable().subscribe(onNext: {result in
            print("Sucesso", result)
            self.modelResult = result
            self.delegate?.reload()

        }, onError: {error in
             print("error",error)
            self.delegate?.error()
        }).disposed(by: disposable)
    }
}
