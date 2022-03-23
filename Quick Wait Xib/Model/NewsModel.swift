//  NewsModel.swift
//  Quick Wait Xib
//  Created by Juninho on 15/02/22.

import Foundation

public struct NewsModel: Codable {
    let articles: [Articles]
    
}

public struct Articles: Codable {
    
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let content: String?
    let publishedAt: String?
}


public struct Source: Codable {
    
    let name: String?
    
    init(name: String) {
        self.name = name
    }
    
    func map() -> [String: Any] {
        return ["name": self.name]
    }
    
    //corrigir caso esteja com letra maiúscula
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}


extension NewsModel {
    // Resgatar Api Json com forma de OBJ
    static var Get:  Resource<NewsModel> = {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?category=health&country=br&language=pt&apiKey=b114a79ce39e43d38fb409be42f195bb") else{
            fatalError("URL is incorrect!")
        }
        return Resource<NewsModel>(url: url)
    }()
}
