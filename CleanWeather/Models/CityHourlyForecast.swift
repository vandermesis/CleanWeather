//
//  CityHourlyForecast.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 20/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityHourlyForecast: Codable {
    
    let coordinates: String
    let dateTimestamp: Double
    let temperature: Double
    let precipProbability: Double
    let icon: String
    
    var symbol: WeatherSymbol {
        return WeatherSymbol(rawValue: icon) ?? .isEmpty
    }
}
