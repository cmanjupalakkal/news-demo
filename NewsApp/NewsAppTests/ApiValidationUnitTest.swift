//
//  ApiValidationUnitTest.swift
//  NewsAppTests
//
//  Created by Manjusha Chembra on 24/07/21.
//

import XCTest
@testable import NewsApp

class ApiValidationUnitTest: XCTestCase {

    func testGetNews_InvalidKey() {
        let networkManager = NetworkManager()
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2021-06-25&sortBy=publishedAt&apiKey=7754ee687b214b339e54f78274fcwer"
        
        networkManager.getNews(url: url) { (news, error) in
            XCTAssertNil(news)
            XCTAssertNotNil(error)
            XCTAssertEqual("Your API key is invalid or incorrect. Check your key, or go to https://newsapi.org to create a free API key.", error)
        }
      }
    
    func testGetNews_ValidUrl() {
        let networkManager = NetworkManager()
        let urlString = "\(networkManager.baseUrl)\(networkManager.usHeadline)&apiKey=\(networkManager.key)"
        
        networkManager.getNews(url: urlString) { (news, error) in
            XCTAssertNotNil(news)
            XCTAssertNil(error)
            
        }
      }
    
    func testImage_WhenUrlNull() {
        let networkManager = NetworkManager()
        let urlString = "\(networkManager.baseUrl)\(networkManager.usHeadline)&apiKey=\(networkManager.key)"
        
        networkManager.getNews(url: urlString) { (news, error) in
            XCTAssertNotNil(news)
            XCTAssertNil(error)
            
        }
      }
}
