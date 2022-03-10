//
//  NewsViewModel.swift
//  Quick Wait Xib
//
//  Created by Juninho on 18/02/22.
//

import Foundation


class NewsViewModel {
    
    var newsViewModel: [Articles]
    init() {
        self.newsViewModel = [Articles]()
    }
}

extension NewsViewModel {
    func newsViewModel(at index:Int) -> Articles   {
        return self.newsViewModel[index]
    }
}

struct PostModel {
    let post: Articles
}

extension PostModel{
    var title: String{
        return self.post.title ?? ""
    }
//    var body: String{
//        return self.post.body
//    }
}
