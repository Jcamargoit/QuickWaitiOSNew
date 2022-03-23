//
//  RegisterTests.swift
//  Quick Wait XibTests
//
//  Created by Framework Digital on 22/03/22.
//

import XCTest
@testable import Quick_Wait_Xib

class RegisterTests: XCTestCase {
    
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
        registerModel.setPhoneNumber(phoneNumber: "14996282935")
        
        return XCTAssert(registerModel.returnValidPhone())
    }
    
    func testREGISTERAllDataIsBeingInserted() {
        registerModel.setUserName(username: "Teste")
        registerModel.setEmail(email: "Teste")
        registerModel.setPhoneNumber(phoneNumber: "Teste")
        registerModel.setCpf(cpf: "Teste")
        registerModel.setPassword(password: "Teste")
        
        return XCTAssert(registerModel.checkAllFields())
    }

}
