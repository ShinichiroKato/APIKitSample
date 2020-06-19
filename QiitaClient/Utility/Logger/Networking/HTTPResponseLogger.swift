//
//  HTTPResponseLogger.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation
import os.log

/// HTTP Response 用の Logger
/// - `outputOptions` を変更することで、ログ出力する情報をコントロールできる
enum HTTPResponseLogger {
    /// 出力する情報 (default は minimum)
    static var outputOptions: OutputOptions = .minimum

    /// Console.app へ出力させたくない場合は debug などに変更すること
    static var logType: OSLogType = .default

    static private let log = OSLog(subsystem: NetworkingLogger.subsystem, category: NetworkingLogger.category)

    /// ログ出力する情報の種類
    struct OutputOptions: OptionSet {
        let rawValue: Int
        static let statusCode = OutputOptions(rawValue: 1 << 0)
        static let header = OutputOptions(rawValue: 1 << 1)
        static let json = OutputOptions(rawValue: 1 << 2)

        static let minimum: OutputOptions = []
        static let all: OutputOptions = [.statusCode, .header, .json]
    }

    static func print(_ response: HTTPURLResponse, data: Data) {
        #if DEBUG
        let log = HTTPResponseLogger.log
        let type = HTTPResponseLogger.logType
        let outputOptions = HTTPResponseLogger.outputOptions

        let urlString: String = {
            let tmp = response.url?.absoluteString ?? "nil"
            return "◁ \(tmp)"
        }()

        var statusCodeString = ""
        var headersString = ""

        if outputOptions.contains(.statusCode) {
            statusCodeString = "◁ Status code: \(response.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: response.statusCode))\n"
        }

        if outputOptions.contains(.header) {
            let headers = response.allHeaderFields.filter { element -> Bool in
                let key = String(describing: element.key)
                return key != "Set-Cookie"
            }

            headersString += "◁ Header:"

            headers.forEach { element in
                headersString += "\n    ◁ \(String(describing: element.key)), Value: \(element.value)"
            }

            headersString += "\n"
        }

        var bodyString = ""
        if outputOptions.contains(.json) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                bodyString = "◁ body: \n\(json)"
            } catch let error {
                bodyString = "◁ body: \n‼️error: \(error.localizedDescription)"
            }
        }

        os_log("⬅️ response:\n%@\n%@%{private}@%{private}@\n", log: log, type: type, urlString, statusCodeString, headersString, bodyString)
        #endif
    }
}
