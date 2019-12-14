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

struct Request<T: Codable> {

    typealias CodableAPICompletion = (Result<T, Error>) -> Void

    let url: String
    let method: String
    let parameters: [String: Any]?
    let completion: CodableAPICompletion?

    init(url: String,
         method: HTTPMethod, // to bym nei robil opcjonalne, niech to bedzie wymuszane
         parameters: [String: Any]? = nil, // parametry są opcjonalne wiec podawać nei trzeba
         completion: CodableAPICompletion? = nil) {
        self.url = url
        self.method = method.rawValue
        self.parameters = parameters
        self.completion = { result in
            DispatchQueue.main.async {
                completion?(result)
            }
        }
    }
}
