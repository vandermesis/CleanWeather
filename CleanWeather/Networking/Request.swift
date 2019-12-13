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
}

struct Request<T> {

    typealias CompletionCompletion = (Result<T, Error>) -> Void

    let url: String
    let path: String
    let method: String
    let parameters: [String: Any]?
    let completion: CompletionCompletion?

    init(url: String,
         path: String,
         method: HTTPMethod = .get,
         parameters: [String: Any]? = nil,
         completion: CompletionCompletion? = nil) {
        self.url = url
        self.path = path
        self.method = method.rawValue
        self.parameters = parameters
        self.completion = { result in
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
}
