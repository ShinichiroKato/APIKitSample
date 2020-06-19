//
//  HTTPRequestLogger.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation
import APIKit
import os.log

/// HTTP Request 用の Logger
/// - `outputOptions` を変更することで、ログ出力する情報をコントロールできる
enum HTTPRequestLogger {
    /// 出力する情報 (default は minimum)
    static var outputOptions: OutputOptions = .minimum

    /// Console.app へ出力させたくない場合は debug などに変更すること
    static var logType: OSLogType = .default

    static private let log = OSLog(subsystem: NetworkingLogger.subsystem, category: NetworkingLogger.category)

    /// ログ出力する情報の種類
    struct OutputOptions: OptionSet {
        let rawValue: Int
        static let header = OutputOptions(rawValue: 1 << 0)

        static let minimum: OutputOptions = []
        static let all: OutputOptions = [.header]
    }

    static func print<T: APIKit.Request>(_ request: T) {
        #if DEBUG
        let message = "\(request.method.rawValue) \(request.path)\n▷ \(request)"
        os_log("➡️ request: %@", log: HTTPRequestLogger.log, type: HTTPRequestLogger.logType, message)
        #endif
    }

    static func printHeader(_ request: URLRequest) {
        #if DEBUG
        guard HTTPRequestLogger.outputOptions.contains(.header) else { return }

        var headersString = "empty"

        if let headers = request.allHTTPHeaderFields {
            headersString = ""
            headers.forEach { element in
                headersString += "\n    ▷ \(element.key), Value: \(element.value)"
            }
        }

        os_log("▷ Header: %{private}@", log: HTTPRequestLogger.log, type: HTTPRequestLogger.logType, headersString)
        #endif
    }
}
