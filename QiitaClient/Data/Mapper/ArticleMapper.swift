//
//  ArticleMapper.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct ArticleMapper {
    static func map(_ entity: ArticleEntity) -> Article {
        Article(
            id: ArticleId(rawValue: entity.id),
            title: entity.title,
            body: entity.body,
            tags: [],
            url: URL(string: entity.url)!,
            likesCount: entity.likesCount,
            createdAt: entity.createdAt,
            updatedAt: entity.updatedAt,
            commentsCount: entity.commentsCount,
            user: UserMapper.map(entity.user)
        )
    }

    static func map(_ entities: [ArticleEntity]) -> [Article] {
        entities.map(map)
    }
}
