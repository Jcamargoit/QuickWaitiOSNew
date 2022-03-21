//
//  Quick_Wait_XibTests.swift
//  Quick Wait XibTests
//
//  Created by Juninho on 19/01/22.
//

import XCTest
@testable import Quick_Wait_Xib

class Quick_Wait_XibTests: XCTestCase {
    
    
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
    
    
    //MARK: - Register Tests
    var registerModel: RegisterUserModel = RegisterUserModel()
    
    //MARK: Get and Set
    func testREGISTERIfUserIsBeingSetAndGet() {
        registerModel.setUserName(username: "Teste")
        
        return XCTAssert(registerModel.getUserName() == "Teste")
    }
    
    func testREGISTERIfEmailIsBeingSetAndGet() {
        registerModel.setEmail(email: "Teste")
        
        return XCTAssert(registerModel.getEmail() == "Teste")
    }
    
    func testREGISTERIfCPFIsBeingSetAndGet() {
        registerModel.setCpf(cpf: "Teste")
        
        return XCTAssert(registerModel.getCpf() == "Teste")
    }
    
    func testREGISTERIfPhoneIsBeingSetAndGet() {
        registerModel.setPhoneNumber(phoneNumber: "Teste")
        
        return XCTAssert(registerModel.getPhoneNumber() == "Teste")
    }
    
    func testREGISTERIfPasswordIsBeingSetAndGet() {
        registerModel.setPassword(password: "Teste")
        
        return XCTAssert(registerModel.getPassword() == "Teste")
    }
    
    //MARK: Valid Camps
    
    func testREGISTEREmailValidation() {
        registerModel.setEmail(email: "ronaldo.samuel@frwk.com.br")
        
        return XCTAssert(registerModel.getEmail().isValidEmail())
    }
    
    func testREGISTERCPFvalidation() {
        registerModel.setCpf(cpf: "506.505.208-58")
        
        return XCTAssert(registerModel.getCpf().isValidCPF)
    }
    
    func testREGISTERPhoneValidation() {
        
    }
    
    func testREGISTERAllDataIsBeingInserted() {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
