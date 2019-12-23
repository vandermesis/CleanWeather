//
//  CityForecast.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 20/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityForecast: Codable {
    
    let id: String
    let dateTimestamp: Double
    let temperature: Double
    let precipProbability: Double
    let icon: String
    
    var symbol: WeatherSymbol {
        return WeatherSymbol(rawValue: icon) ?? .isEmpty
    }
}
