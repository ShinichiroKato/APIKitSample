//
//  QiitaRequest.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import APIKit

protocol QiitaRequest: Request {
    func response(from data: Data, urlResponse: HTTPURLResponse) throws -> Response
}

extension QiitaRequest {

    var baseURL: URL {
        URL(string: "\(URLs.baseUrl.absoluteString)/api/v2")!
    }

    var dataParser: DataParser {
        JSONDataParser()
    }

//    var headerFields: [String: String] {
//        guard let accessToken = MyAppLocalData.authToken() else {
//            return [:]
//        }
//        return ["X-Authentication-Token": accessToken]
//        return [:]
//    }
}

extension QiitaRequest where Response: Decodable {

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {

        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }

        HTTPResponseLogger.print(urlResponse, data: data)

        return try response(from: data, urlResponse: urlResponse)
    }

    func response(from data: Data, urlResponse: HTTPURLResponse) throws -> Response {

        let parser = DecodableJSONParser<Response>()
        guard let result = try parser.parse(data: data) as? Response else {
            throw ResponseError.unexpectedObject(data)
        }
        return result
    }

    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard 200..<300 ~= urlResponse.statusCode else {
            let decoder = JSONDecoder()
            let errorEntity = try decoder.decode(ErrorEntity.self, from: object as! Data)
            let error = HTTPStatusError(statusCode: urlResponse.statusCode, errorEntity: errorEntity)
            throw error
        }
        return object
    }
}
