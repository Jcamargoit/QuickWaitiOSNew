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

struct responseLogin: Codable {
    let message: String?
}


extension RegisterUserModel {
 
    
    static func registerNewUser(registerUserModel: RegisterUserViewModel) -> Resource<responseLogin?>{
        
        let order = RegisterUserModel(registerUserModel)
        guard let url = URL(string: "localhost:8072/auth/api/auth/signup") else{
            fatalError("URL is incorrect!")
        }
       guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        var resource = Resource<responseLogin?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        return resource
        
    }
    
}

extension RegisterUserModel {
    
    init?(_ registerUserModel: RegisterUserViewModel){
        
        guard let username = registerUserModel.username,
              let email = registerUserModel.email,
              let password = registerUserModel.password,
              let cpf = registerUserModel.cpf,
              let phoneNumber = registerUserModel.phoneNumber else {
                
                return nil
              }
        self.username = username
        self.email = email
        self.password = password
        self.cpf = cpf
        self.phoneNumber = phoneNumber
        
    }
}
