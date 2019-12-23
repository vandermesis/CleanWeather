//
//  Coordinates.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 20/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct Coordinates {

    var lat: Double
    var lon: Double

    var stringValue: String {
        return "\(lat),\(lon)"
    }
}
