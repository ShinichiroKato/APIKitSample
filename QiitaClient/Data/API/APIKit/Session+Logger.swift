//
//  Session+Logger.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import APIKit

extension Session {

    @discardableResult
    class func sendRequest<Request: APIKit.Request>(_ request: Request, callbackQueue: CallbackQueue? = nil, handler: @escaping (Swift.Result<Request.Response, SessionTaskError>) -> Void = { _ in }) -> SessionTask? {
        HTTPRequestLogger.print(request)
        return self.send(request, callbackQueue: callbackQueue, handler: handler)
    }
}
