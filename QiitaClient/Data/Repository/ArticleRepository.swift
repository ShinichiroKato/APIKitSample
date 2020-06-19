//
//  ArticleRepository.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation
import APIKit

final class ArticleRepositoryProvider {
    static private var shared = ArticleRepositoryImpl()

    static func provide() -> ArticleRepository {
        return ArticleRepositoryProvider.shared
    }
}

protocol ArticleRepository {

    func get(completion: @escaping (Result<[Article]>) -> Void)
}

struct ArticleRepositoryImpl: ArticleRepository {

    func get(completion: @escaping (Result<[Article]>) -> Void) {
        let requset = ArticleRequsest()

        Session.sendRequest(requset) { result in
            switch result {
            case .success(let response):
                let articles = ArticleMapper.map(response)
                completion(.success(articles))
            case .failure(.responseError(let error as HTTPStatusError)):
                let error = ErrorMapper.map(error)
                completion(.failure(error))
            case .failure(let error):
                let error = ErrorMapper.map(error)
                completion(.failure(error))
            }
        }
    }
}
