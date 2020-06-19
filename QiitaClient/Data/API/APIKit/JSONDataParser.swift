//
//  JSONDataParser.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import APIKit

struct JSONDataParser: DataParser {
    let contentType: String? = "application/json"

    func parse(data: Data) throws -> Any {
        data
    }
}
