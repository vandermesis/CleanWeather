//
//  CityWeather.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityWeather: Codable {
    
    let id: String
    let city: String
    let latitude: Double
    let longitude: Double
    let temperature: Double
    let icon: String
    
    var symbol: WeatherSymbol {
        return WeatherSymbol(rawValue: icon) ?? .isEmpty
    }
}
