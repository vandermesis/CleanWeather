//
//  CityHistorical.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityHistorical: Codable {

    let id: String
    let city: String
    let temperature: Double
    let icon: String

    var symbol: WeatherSymbol {
        return WeatherSymbol(rawValue: icon) ?? .isEmpty
    }
}
