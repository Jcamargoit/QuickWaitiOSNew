//
//  LoginTests.swift
//  Quick Wait XibTests
//
//  Created by Framework Digital on 22/03/22.
//

import XCTest
@testable import Quick_Wait_Xib

class LoginTests: XCTestCase {
    
    //MARK: - Login Tests
    var login: LoginModel = LoginModel()
    
    //MARK: Get and Set
    func testLOGINIfUserGetAndSetIsWorking() {
            login.setUser(user: "Teste")
        
        return XCTAssert(login.getUser() == "Teste")
    }
    
    func testLOGINIfPasswordGetAndSetIsWorking() {
            login.setPassword(password: "Teste")
        
        return XCTAssert(login.getPassword() == "Teste")
    }
    
    func testLOGINIfDataIsBeingInsert() {
            login.setUser(user: "Teste")
            login.setPassword(password: "Teste")
        
        return XCTAssert(login.checkAllFields())
    }

}
