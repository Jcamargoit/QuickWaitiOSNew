//
//  LoginResultCodable.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 16/03/22.
//

import Foundation

struct LoginResultCodable: Codable {
    var username: String?
    var token: String?
    var status: Int?
    var message: String?
    var email: String?
    var id: Int?
}
