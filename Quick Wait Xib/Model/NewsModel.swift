//  NewsModel.swift
//  Quick Wait Xib
//  Created by Juninho on 15/02/22.

import Foundation

// MARK: - Empty
class NewsModel {
    
    var status: String?
    var totalResults: Int?
    var articles: [String]
    
    
    init() {
        self.status = ""
        self.totalResults = 0
        self.articles = []
    }
    
    init(codable: NewsResultCodable) {
        
        self.status = codable.status
        self.totalResults = codable.totalResults
        self.articles = []
        
        for item in codable.articles {
            self.articles.append(item.source.name ?? "")
        }
    }
}
