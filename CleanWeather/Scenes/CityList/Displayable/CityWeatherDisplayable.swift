//
//  CityWeatherDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityWeatherDisplayable {
    
    let cityName: String
    let cityWeatherIcon: WeatherSymbol
    let cityTemp: String
    
    static func convert(from object: CityWeather) -> CityWeatherDisplayable {
        
        let temp = "\(Int(object.temperature.rounded()))°"
        
        return CityWeatherDisplayable(cityName: object.city, cityWeatherIcon: object.symbol, cityTemp: temp)
    }
}
