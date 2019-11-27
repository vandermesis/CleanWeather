//
//  CityForecast.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 20/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityForecast: Codable {
    
    let id: String
    let hour: Int
    let hourTemp: Double
    let hourPrecipProbability: Double
    let icon: String
    
    var symbol: WeatherSymbol {
        return WeatherSymbol(rawValue: icon) ?? .isEmpty
    }
}
