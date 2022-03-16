//
//  LoginRouter.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 16/03/22.
//

import Foundation
import Alamofire

enum UserRouter: APIConfiguration {
    
    case loginUser(user: LoginModel)
    case registerUser(nome: String, email: String)
    
    
    var method: HTTPMethod {
        switch self {
        case .registerUser:
            return .post
        default:
            return .post
        }
    }
    var parameters: RequestParams {
        switch self {
        case .loginUser(let user):
            return .body([
                "username": user.getUser(),
                "password": user.getPassword()
            ])
        case .registerUser(let nome,let email):
            return .body([
                "nome": nome,
                "email": email
            ])
        default:
            return .url([:])
        }
    }
    
    var path: String {
        switch self {
        case .registerUser:
            return "signin"
        case .loginUser:
            return "signup"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.API.urlUser.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        
        switch parameters {
               
               case .body(let params):
                   urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
                   
               case .url(let params):
                   let queryParams = params.map { pair  in
                       return URLQueryItem(name: pair.key, value: "\(pair.value)")
                   }
                   var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                   components?.queryItems = queryParams
                   urlRequest.url = components?.url
        default: break
               }
        
        return urlRequest
    }
}
