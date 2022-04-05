//
//  NewsRouter.swift
//  Quick Wait Xib
//
//  Created by Juninho on 21/03/22.
//

import Foundation
import Alamofire

enum NewsRouter: APIConfiguration {

    case userNews

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var parameters: RequestParams {
        switch self {
        default:
            return .url([:])
        }
    }

    var path: String {
        switch self {
        case .userNews:
            return "news"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try Constants.API.newsUser.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        // User default
        let token: String = ""// UserDefaults.standard.string(forKey: "TokenAcesso") ?? ""

        urlRequest.httpMethod = method.rawValue

        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        // Resgatar no user Default

        switch parameters {

        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])

        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        default: break
        }

        return urlRequest
    }
}
