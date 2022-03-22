//
//  NewsClient.swift
//  Quick Wait Xib
//
//  Created by Juninho on 21/03/22.
//

import Foundation
import RxSwift


class NewsClient: APIClient {
    
    static func getNews() -> Observable<NewsResultCodable> {
        return request(NewsRouter.userNews)
    }
    
}
