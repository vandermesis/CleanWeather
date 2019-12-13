//
//  URLComponentsExtension.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 13/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

extension URLComponents {
    var queryItemsDictionary: [String: Any] {
        set (queryItemsDictionary) {
            self.queryItems = queryItemsDictionary.map {
                URLQueryItem(name: $0, value: "\($1)")
            }
        }
        get {
            var params = [String: Any]()
            return queryItems?.reduce([:], { _, item -> [String: Any] in
                params[item.name] = item.value
                return params
            }) ?? [:]
        }
    }
}
