//
//  ErrorMapper.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct ErrorMapper {
    static func map(_ error: Error) -> ErrorMessage {
        ErrorMessage(statusCode: nil, title: "Error", message: error.localizedDescription)
    }

    static func map(_ statusError: HTTPStatusError) -> ErrorMessage {
        ErrorMessage(statusCode: statusError.statusCode, title: "\(statusError.statusCode) - \(statusError.errorEntity.type)", message: statusError.errorEntity.message)
    }
}
