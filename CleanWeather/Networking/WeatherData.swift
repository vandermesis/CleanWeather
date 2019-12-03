//
//  WeatherData.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct WeatherData: Codable {

    let currently: Currently
}

struct Currently: Codable {

    let temperature: Double
    let apparentTemperature: Double
    let icon: String
}
