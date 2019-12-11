//
//  SerializerHelper.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 08/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

final class SerializerHelper {

    static let shared = SerializerHelper()

    let decoder: JSONDecoder
    let encoder: JSONEncoder

    private init() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
    }
}

