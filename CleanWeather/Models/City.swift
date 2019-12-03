//
//  City.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct City {

    let id: String
    let name: String
    let latitude: Double
    let longitude: Double

    init(id: String, name: String, lat: Double, lon: Double) {
        self.id = id
        self.name = name
        self.latitude = lat
        self.longitude = lon
    }
}
