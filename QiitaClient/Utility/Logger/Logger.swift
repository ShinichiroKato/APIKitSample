//
//  Logger.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation
import os.log

/// os.log を使ってログ出力する、汎用的なLogger
/// - Log Level を指定することでログ出力をコントールできる
/// - iOS Simulator で Console.app へもログ出力したい場合は `print()` を使う
enum Logger {
    enum Level: Int {
        case debug = 0
        case info = 1
        case error = 2
        case fault = 3
    }

    static var level: Level = .info
    private static let log = OSLog(subsystem: OSLog.QiitaClient.subsystem, category: "Logger")

    static func configure() {
        #if DEBUG
        Logger.level = .debug
        #endif
        Logger.printAppInfo()
    }

    // MARK: - Logging

    /// OSLogType.default で出力
    /// - Logger.Level.debug 以上の時にログ出力
    /// - iOS Simulator で Console.app へもログ出力したい場合に利用する
    static func print(_ message: String) {
        guard Logger.level <= Logger.Level.debug else { return }
        os_log("%@", log: Logger.log, type: .default, message)
    }

    static func debug(_ message: String) {
        guard Logger.level <= Logger.Level.debug else { return }
        os_log("%@%@", log: Logger.log, type: .debug, Logger.Level.debug.prefix, message)
    }

    static func info(_ message: String) {
        guard Logger.level <= Logger.Level.info else { return }
        os_log("%@%@", log: Logger.log, type: .info, Logger.Level.info.prefix, message)
    }

    static func error(_ message: String) {
        guard Logger.level <= Logger.Level.error else { return }
        os_log("%@%@", log: Logger.log, type: .error, Logger.Level.error.prefix, message)
    }

    static func fault(_ message: String,
                      file: String = #file,
                      function: String = #function,
                      line: Int = #line) {
        guard Logger.level <= Logger.Level.error else { return }
        os_log("%@%@\n%@,%@,%d", log: Logger.log, type: .fault, Logger.Level.error.prefix, message, file, function, line)
    }

    private static func printAppInfo() {
        Logger.print("****************************************")

        // OS Version
        Logger.print("iOS: \(ProcessInfo().operatingSystemVersionString)")

        // App Version
        if let shortVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"],
          let bundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"] {
          Logger.print("App: \(shortVersion) (\(bundleVersion))")
        } else {
          fatalError("[Logger] CFBundleShortVersionString or CFBundleVersion is nil.")
        }

        Logger.print("****************************************")
    }
}

// MARK: - Logger.Level

extension Logger.Level: Comparable {
    static func < (lhs: Logger.Level, rhs: Logger.Level) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Logger.Level {
    /// ログの prefix に使用する文字列
    var prefix: String {
        switch self {
        case .debug:
            return "🔍"
        case .info:
            return "❕"
        case .error:
            return "‼️"
        case .fault:
            return "🔥"
        }
    }
}

extension OSLog {
    enum QiitaClient {
        static var subsystem = Bundle.main.bundleIdentifier!

        #if DEBUG
        static let ui = OSLog(subsystem: subsystem, category: "UI")
        static let general = OSLog(subsystem: subsystem, category: "General")
        #endif
    }
}
