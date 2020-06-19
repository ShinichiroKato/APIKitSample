//
//  ArticleRequsest.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import APIKit

struct ArticleRequsest: QiitaRequest {

    typealias Response = [ArticleEntity]

    let method = HTTPMethod.get
    let path = "/items"
}
