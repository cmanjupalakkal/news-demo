//
//  NewsModel.swift
//  NewsApp
//
//  Created by Manjusha Chembra on 24/07/21.
//

import Foundation

struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsDetailModel]
}

struct NewsDetailModel: Codable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct ErrorModel: Codable {
    let status: String
    let code: String
    let message: String
}


