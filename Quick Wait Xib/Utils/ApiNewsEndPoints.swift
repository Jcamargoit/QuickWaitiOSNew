//
//  NewsEndPoints.swift
//  Quick Wait Xib
//
//  Created by Juninho on 15/02/22.
//

import Foundation

public enum ApiNewsEndPoint {

    func urlForNews() -> URL? {
        return URL(string: "https://newsapi.org/v2/top-headlines?category=health&country=br&language=pt&apiKey=b114a79ce39e43d38fb409be42f195bb")
    }

}
