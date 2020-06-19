//
//  User.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct UserId: Id {
    let rawValue: String
}

struct User: Identifiable {
    let id: UserId

}

extension User {

}
