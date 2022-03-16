//
//  NetworkLogger.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 16/03/22.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
    let queue = DispatchQueue(label: "com.juninho.Quick-Wait-Xib-New")
    
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }
    
    func request<Value>(_ request: DataRequest, didParseReponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else { return }
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}
