//
//  RegisterUserModel.swift
//  Quick Wait
//
//  Created by Juninho on 24/01/22.
//

import Foundation

class RegisterUserModel {

    private var username: String
    private var email: String
    private var password: String
    private var cpf: String
    private var phoneNumber: String

    init() {
        self.username = ""
        self.email = ""
        self.password = ""
        self.cpf = ""
        self.phoneNumber = ""
    }

    func getUserName() -> String {
        return self.username
    }

    func getEmail() -> String {
        return self.email
    }

    func getPassword() -> String {
        return self.password
    }

    func getCpf() -> String {
        return self.cpf
    }

    func getPhoneNumber() -> String {
        return self.phoneNumber
    }

    func setUserName(username: String) {
        self.username = username
    }

    func setEmail(email: String) {
        self.email = email
    }

    func setPassword(password: String) {
        self.password = password
    }

    func setCpf(cpf: String) {
        self.cpf = cpf
    }

    func setPhoneNumber(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }

    func checkAllFields() -> Bool {
        return !self.username.isEmpty && !self.email.isEmpty && !self.password.isEmpty && !self.cpf.isEmpty && !self.phoneNumber.isEmpty
    }

    func returnCpfValid() -> Bool {
        return self.cpf.isValidCPF
    }

    func returnValidPhone() -> Bool {
        return self.phoneNumber.count == 11 || self.phoneNumber.count == 10
    }

}
