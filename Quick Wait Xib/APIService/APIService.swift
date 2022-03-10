//
//  APIService.swift
//  Quick Wait Xib
//
//  Created by Juninho on 15/02/22.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"

}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil

}

extension Resource {
    init(url: URL) {
        self.url = url
    }
}

class APIService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
