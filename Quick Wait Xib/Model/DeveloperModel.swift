//
//  DeveloperModel.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 06/04/22.
//

import Foundation

class DeveloperModelElement {
    var id: Int
    var imageURL: String
    var name: String
    var ocupation: String
    var description: String
    var email: String

    init(id: Int, name: String, ocupation: String,
         description: String, email: String, imageURL: String) {
        self.id = id
        self.name = name
        self.ocupation = ocupation
        self.description = description
        self.email = email
        self.imageURL = imageURL
    }

}

typealias DeveloperModel = [DeveloperModelElement]
