//
//  LoginModel.swift
//  Quick Wait
//
//  Created by Juninho on 24/01/22.
//

import Foundation

class LoginModel {
    private var user: String
    private var password: String

    init() {
        self.user = ""
        self.password = ""
    }

    init(user: String, password: String) {
        self.user = user
        self.password = password
    }

    func getUser() -> String {
        return self.user
    }

    func getPassword() -> String {
        return self.password
    }

    func setUser(user: String) {
        self.user = user
    }

    func setPassword(password: String) {
        self.password = password
    }

    func checkAllFields() -> Bool {
        return !self.user.isEmpty && !self.password.isEmpty
    }
}
