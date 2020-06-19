//
//  ErrorEntity.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct ErrorEntity: Decodable, Error {
    let message: String
    let type: String
}

struct HTTPStatusError: Error {
    let statusCode: Int
    let errorEntity: ErrorEntity
}
