//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Manjusha Chembra on 24/07/21.
//

import Foundation

struct NewsViewModel {
    let news: NewsDetailModel
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var decsription: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/0/07/News.png"
    }
}
