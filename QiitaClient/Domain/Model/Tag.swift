//
//  Tag.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

struct Tag {
    let name: String
}

extension Tag: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}
