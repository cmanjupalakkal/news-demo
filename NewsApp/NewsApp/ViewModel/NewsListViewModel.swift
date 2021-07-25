//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Manjusha Chembra on 24/07/21.
//

import Foundation

class NewsListViewModel {
    
    var newsViewModel = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(completion: @escaping (String?) -> Void) {
        let obj = NetworkManager()
        let urlString = "\(obj.baseUrl)\(obj.usHeadline)&apiKey=\(obj.key)"
        obj.getNews(url: urlString, completion: { (news, error) in
            guard let news = news else { return }
            let newsVM = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsViewModel = newsVM
                completion(error)
            }
        })
    }
}
