//
//  HeaderKey.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

enum HeaderKey: String {

    case totalConut = "Total-Count"

    var lowercasedValue: String {
        self.rawValue.lowercased()
    }

    var uppercasedValue: String {
        self.rawValue.uppercased()
    }
}

extension HTTPURLResponse {

    func headerFields(for headerKey: HeaderKey) -> String? {
        self.allHeaderFields[headerKey.rawValue] as? String ??
            self.allHeaderFields[headerKey.lowercasedValue] as? String ??
            self.allHeaderFields[headerKey.uppercasedValue] as? String
    }
}
