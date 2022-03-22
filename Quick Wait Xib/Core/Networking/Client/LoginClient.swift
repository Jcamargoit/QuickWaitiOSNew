//
//  LoginClient.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 16/03/22.
//

import Foundation
import RxSwift

class UserClient: APIClient {
    static func loginUser(loginModel: LoginModel) -> Observable<LoginResultCodable> {
        return request(UserRouter.loginUser(user: loginModel))
    }
    
    static func createUser(registerUserModel: RegisterUserModel) -> Observable<DefaultCodable> {
        return request(UserRouter.registerUser(userRegister: registerUserModel))
    }
    


}
