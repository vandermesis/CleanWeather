//
//  Weather.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct Weather: Codable {
    
    let city: String
    let temperature: Double
    let hourlyTempMin: [Double]
    let hourlyTempMax: [Double]
    let dailyTempMin: [Double]
    let dailyTempMax: [Double]
    let icon: String
    
    var symbol: WeatherSymbol {
        return WeatherSymbol(rawValue: icon) ?? .isEmpty
    }
}
