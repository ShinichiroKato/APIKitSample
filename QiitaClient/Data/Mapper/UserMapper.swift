//
//  UserMapper.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct UserMapper {
    static func map(_ entity: UserEntity) -> User {
        User(id: UserId(rawValue: entity.id))
    }
}
