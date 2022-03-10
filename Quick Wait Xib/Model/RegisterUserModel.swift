//
//  RegisterUserModel.swift
//  Quick Wait
//
//  Created by Juninho on 24/01/22.
//

import Foundation


struct CriarConta:Codable {
    
    var username: String?
    var email: String?
    var password: String?
    var cpf: String?
    var phoneNumber: String?
    
}

struct responseLogin: Codable {
    let message: String?
}


extension CriarConta {
 
    
    static func login(vm: RegisterUserViewModel) -> Resource<responseLogin?>{
        
        let order = CriarConta(vm)
        guard let url = URL(string: "http://localhost:8072/auth/api/auth/signup") else{
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

extension CriarConta {
    
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

