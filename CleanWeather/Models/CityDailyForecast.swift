//
//  CityDailyForecast.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

struct CityDailyForecast: Codable {

    let coordinates: String
    let dateTimestamp: Double
    let maxTemperature: Double
    let minTemperatyre: Double
    let precipProbability: Double
    let icon: String

    var symbol: WeatherSymbol {
        return WeatherSymbol(rawValue: icon) ?? .isEmpty
    }
}
