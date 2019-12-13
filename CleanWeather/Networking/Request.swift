//
//  Request.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

enum Encoding: String {
    case json
    case xml
}

struct Request {

    typealias CompletionCompletion = (Result<[City], Error>) -> Void

    let url: String
    let method: HTTPMethod
    let parameters: Parameters?
    let parameterEncoding: Encoding
    let log: Bool
    let requireAuthorization: Bool
    let isMultipartRequest: Bool
    let isCurityRefreshingRequest: Bool
    let completion: CompletionCompletion?

    init(url: String,
         method: HTTPMethod = .get,
         parameters: Parameters? = nil,
         parameterEncoding: Encoding = .json,
         log: Bool = true,
         requireAuthorization: Bool = false,
         isMultipartRequest: Bool = false,
         isCurityRefreshingRequest: Bool = false,
         completion: CompletionCompletion? = nil) {
        let absoluteUrl = url.appendBackendUrlIfNeeded()
        self.url = absoluteUrl
        self.method = method
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
        self.log = log
        self.requireAuthorization = requireAuthorization
        self.isMultipartRequest = isMultipartRequest
        self.isCurityRefreshingRequest = isCurityRefreshingRequest
        self.completion = { result in
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
}

extension String {
    func appendBackendUrlIfNeeded() -> String {
        // Some logic
        return self
    }
}
