//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Manjusha Chembra on 24/07/21.
//

import Foundation

class NetworkManager {
    
    let imageCache = NSCache<NSString, NSData>()
    var session: URLSession!
    let baseUrl = "https://newsapi.org/v2/"
    let usHeadline = "top-headlines?country=us"
    let key = "7754ee687b214b339e54f78274fc812b"

    func getNews(url: String, completion: @escaping ([NewsDetailModel]?, String?) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil, error.debugDescription)
                return
            }
            
            let newsModel = try? JSONDecoder().decode(NewsModel.self, from: data)
            if newsModel == nil {
                let errorModel = try? JSONDecoder().decode(ErrorModel.self, from: data)
                completion(nil, errorModel?.message)
            } else {
                completion(newsModel!.articles, error.debugDescription)
            }
            
        }.resume()
    }
    
    func getImage(url: String, completion: @escaping (Data?) -> Void) {
        guard let urlString = URL(string: url)else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: url)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: urlString) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: url))
                completion(data)
                
            }.resume()
        }
                  
    }
    
}
