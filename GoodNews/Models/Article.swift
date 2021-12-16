//
//  Article.swift
//  GoodNews
//
//  Created by Macbook on 12/16/21.
//

import Foundation

struct Article: Decodable {
    var title: String
    var description: String
}

struct ArticleList: Decodable {
    let articles: [Article]
}
