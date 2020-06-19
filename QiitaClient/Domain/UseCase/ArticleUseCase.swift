//
//  ArticleUseCase.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

final class ArticleUseCaseProvider {
    static func provide() -> ArticleUseCase {
        return ArticleUseCaseImpl(
            articleRepository: ArticleRepositoryProvider.provide()
        )
    }
}

protocol ArticleUseCase {

    var articleRepository: ArticleRepository { get }

    func get(completion: @escaping (Result<[Article]>) -> Void)
}

final class ArticleUseCaseImpl: ArticleUseCase {

    var articleRepository: ArticleRepository

    init(articleRepository: ArticleRepository) {
        self.articleRepository = articleRepository
    }

    func get(completion: @escaping (Result<[Article]>) -> Void) {
        self.articleRepository.get(completion: completion)
    }
}
