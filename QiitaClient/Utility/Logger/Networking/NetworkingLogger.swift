//
//  NetworkingLogger.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation
import os.log

/// Network 系のログ出力を統括する
enum NetworkingLogger {
    static let subsystem = OSLog.QiitaClient.subsystem
    static let category = "Network"

    /// 各種 Logger を初期設定する
    static func configure() {
        #if DEBUG
        HTTPRequestLogger.outputOptions = []
        HTTPResponseLogger.outputOptions = [.statusCode]
        #endif
    }
}
