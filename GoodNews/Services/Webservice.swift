//
//  WebService.swift
//  GoodNews
//
//  Created by Macbook on 12/16/21.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articlesList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articlesList {
                    completion(articlesList?.articles)
                }
                
                print(articlesList?.articles)
            }
            
        }.resume()
        
    }
    
}
