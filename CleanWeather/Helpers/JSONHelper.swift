//
//  JSONHelper.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 08/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

final class JSONHelper {

    static let shared = JSONHelper()

    let decoder: JSONDecoder
    let encoder: JSONEncoder

    private init() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
    }
}
