//
//  DecodableJSONParser.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import APIKit

final class DecodableJSONParser<T: Decodable>: DataParser {
    let contentType: String? = "application/json"

    func parse(data: Data) throws -> Any {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 //.iso8601withFractionalSeconds
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try decoder.decode(T.self, from: data)
    }
}
