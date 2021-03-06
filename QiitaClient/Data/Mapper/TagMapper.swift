//
//  TagMapper.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct TagMapper {
    static func map(_ entity: TagEntity) -> Tag {
        Tag(name: entity.name)
    }
}
