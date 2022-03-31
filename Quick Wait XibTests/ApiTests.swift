//
//  ApiTests.swift
//  Quick Wait XibTests
//
//  Created by Framework Digital on 30/03/22.
//

import XCTest
import RxSwift
import RxRelay
@testable import Quick_Wait_Xib

class ApiTests: XCTestCase {
    var disposable: DisposeBag = DisposeBag()
    
    //Test Login
    func testIfLoginIsWorking() {
        UserClient.loginUser(loginModel: fillUpLoginData()).asObservable().subscribe(onNext: { result in
            return XCTAssert(result.status == 200)
        }, onError: { _ in
            return XCTAssert(false)
        }).disposed(by: disposable)
        
    }
    
    func fillUpLoginData() -> LoginModel {
        let loginModel: LoginModel = LoginModel()

        loginModel.setUser(user: "admin")
        loginModel.setPassword(password: "123321")
        
        return loginModel
    }
    
    func testIfSiginIsWorking() {
        UserClient.createUser(registerUserModel: fillUpSiginData())
            .asObservable().subscribe(
            onNext: {
                result in
                return XCTAssert(result.status == 200)
            },
            onError: {
                error in
                return XCTAssert(false)
        }).disposed(by: disposable)
    }
    
    func fillUpSiginData() -> RegisterUserModel {
        let siginModel: RegisterUserModel = RegisterUserModel()
        
        siginModel.setUserName(username: "admin")
        siginModel.setEmail(email: "ronaldo.samuel2021@gmail.com")
        siginModel.setPhoneNumber(phoneNumber: "14 996282935")
        siginModel.setCpf(cpf: "50650520858")
        siginModel.setPassword(password: "123321")
        
        return siginModel
    }
    
    func testIfRecordsIsBeeingSelected() {
        NewsClient.getNews().asObservable().subscribe(onNext: {
            result in
            return XCTAssert(result.status == "200")
        }, onError: { _ in
            return XCTAssert(false)
        }).disposed(by: disposable)
    }
}
