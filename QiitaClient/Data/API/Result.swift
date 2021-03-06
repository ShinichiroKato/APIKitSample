//
//  Result.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(ErrorMessage)
}
