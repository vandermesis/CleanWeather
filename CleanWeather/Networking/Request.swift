//
//  Request.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

enum Scheme: String {
    case https
}

enum HTTPMethod: String {
    case get
}

enum Encoding: String {
    case json
    case xml
}

struct Request<T> {

    typealias CompletionCompletion = (Result<T, Error>) -> Void

    let url: String
    let path: String
    let scheme: String
    let method: String
    let parameters: [String: String]?
    let parameterEncoding: Encoding
    let completion: CompletionCompletion?

    init(url: String,
         path: String,
         scheme: Scheme = .https,
         method: HTTPMethod = .get,
         parameters: [String: String]? = nil,
         parameterEncoding: Encoding = .json,
         completion: CompletionCompletion? = nil) {
        self.url = url
        self.path = path
        self.scheme = scheme.rawValue
        self.method = method.rawValue
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
        self.completion = { result in
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
}
