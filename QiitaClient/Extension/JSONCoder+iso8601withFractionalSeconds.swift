//
//  JSONCoder+iso8601withFractionalSeconds.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

extension Formatter {
    static var iso8601withFractionalSeconds: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFractionalSeconds)
        return formatter
    }
}

extension Date {
    var iso8601withFractionalSeconds: String {
        Formatter.iso8601withFractionalSeconds.string(from: self)
    }
}

extension String {
    var iso8601withFractionalSeconds: Date? {
        Formatter.iso8601withFractionalSeconds.date(from: self)
    }
}

extension JSONEncoder.DateEncodingStrategy {
    static let iso8601withFractionalSeconds = custom {
        var container = $1.singleValueContainer()
        try container.encode(Formatter.iso8601withFractionalSeconds.string(from: $0))
    }
}

extension JSONDecoder.DateDecodingStrategy {
    static let iso8601withFractionalSeconds = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        guard let date = Formatter.iso8601withFractionalSeconds.date(from: string) else {
            throw DecodingError.dataCorruptedError(in: container,
                  debugDescription: "Invalid date: " + string)
        }
        return date
    }
}
