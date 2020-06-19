//
//  Article.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct ArticleId: Id {
    let rawValue: String
}

struct Article: Identifiable {
    let id: ArticleId
    let title: String
    let body: String
    let tags: [Tag]
    let url: URL
    let likesCount: Int
    let createdAt: Date
    let updatedAt: Date
    let commentsCount: Int
    let user: User
}

extension Article {

}
