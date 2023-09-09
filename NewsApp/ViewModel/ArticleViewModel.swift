//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Aleyna Isikdaglilar [Tuzel Bankacilik Dijital Squad 1] on 8.11.2022.
//

import Foundation

struct ArticleListViewModel {
    let articleList: [Article]
    
    func numberOfRowsInSection() -> Int {
        return articleList.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articleList[index]
        return ArticleViewModel(article: article)
    }
}

struct ArticleViewModel {
    
    let article: Article
    
    var title : String {
        return article.title
    }
    
    var urlToImage : String {
        return article.urlToImage
    }
    
    var content : String {
        return article.content
    }
    
    var url : String {
        return article.url
    }
    
    var author : String {
        return article.author
    }
    
    var publishedAt : String {
        return article.publishedAt
    }
    
    var description : String {
        return article.description
    }
}
