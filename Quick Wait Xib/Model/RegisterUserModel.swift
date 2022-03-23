//
//  RegisterUserModel.swift
//  Quick Wait
//
//  Created by Juninho on 24/01/22.
//

import Foundation

struct RegisterUserModel:Codable {
    
    var username: String?
    var email: String?
    var password: String?
    var cpf: String?
    var phoneNumber: String?
    
}

struct responseRegisterUser: Codable {
    let message: String?
}


extension RegisterUserModel {
 
    static func addNewUser(vm: RegisterUserViewModel) -> Resource<responseRegisterUser?>{
        
        let order = RegisterUserModel(vm)
        guard let url = URL(string: "http://localhost:8072/auth/api/auth/signup") else{
            fatalError("URL is incorrect!")
        }
       guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        var resource = Resource<responseRegisterUser?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        return resource
        
    }
    
}

extension RegisterUserModel {
    
    init?(_ vm: RegisterUserViewModel){
        
        guard let username = vm.username,
              let email = vm.email,
              let password = vm.password,
              let cpf = vm.cpf,
              let phoneNumber = vm.phoneNumber else {
                
                return nil
              }
        self.username = username
        self.email = email
        self.password = password
        self.cpf = cpf
        self.phoneNumber = phoneNumber
        
    }
}

