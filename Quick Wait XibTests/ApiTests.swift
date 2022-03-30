//
//  ApiTests.swift
//  Quick Wait XibTests
//
//  Created by Framework Digital on 30/03/22.
//

import XCTest
import RxSwift
@testable import Quick_Wait_Xib

class ApiTests: XCTestCase {
    var disposable: DisposeBag = DisposeBag()
    
    //Test Login
    func testIfLoginIsWorking() {
        let loginModel: LoginModel = LoginModel()
        
        var returnBool: Bool = false

        loginModel.setUser(user: "admin")
        loginModel.setPassword(password: "123321")
        
        UserClient.loginUser(loginModel: loginModel).asObservable().subscribe(onNext: { result in
            returnBool = result.status == 200
        }, onError: { _ in
            returnBool = false
        }).disposed(by: disposable)
        
        return XCTAssert(returnBool)
        
    }
    
    func testIfSiginIsWorking() {
        let siginModel: RegisterUserModel = RegisterUserModel()
        
        var returnBool: Bool = false
        
        siginModel.setUserName(username: "admin")
        siginModel.setEmail(email: "ronaldo.samuel2021@gmail.com")
        siginModel.setPhoneNumber(phoneNumber: "14 996282935")
        siginModel.setCpf(cpf: "50650520858")
        siginModel.setPassword(password: "123321")
        
        UserClient.createUser(registerUserModel: siginModel).asObservable().subscribe(
            onNext: {
                result in
            returnBool = result.status == 200
        },
            onError: {
                error in
            returnBool = false
        }).disposed(by: disposable)
        
        return XCTAssert(returnBool)
        
    }
    
    func testIfRecordsIsBeeingSelected() {
        var returnBool: Bool = false
        
        NewsClient.getNews().asObservable().subscribe(onNext: {
            result in
            returnBool = result.status == "200"
        }, onError: { _ in
            returnBool = false
        }).disposed(by: disposable)
        
        return XCTAssert(returnBool)
        
    }
}
