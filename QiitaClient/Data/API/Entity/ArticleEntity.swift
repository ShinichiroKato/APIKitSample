//
//  ArticleEntity.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct ArticleEntity: Decodable {
    let id: String
    let title: String
    let body: String
    let tags: [TagEntity]
    let url: String
    let likesCount: Int
    let createdAt: Date
    let updatedAt: Date
    let commentsCount: Int
    let user: UserEntity
}
