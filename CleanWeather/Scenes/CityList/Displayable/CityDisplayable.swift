//
//  CityDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityDisplayable {
    
    let cityName: String
    let cityWeatherIcon: WeatherSymbol
    let cityTempRounded: Int
    
    static func convert(from object: Weather) -> CityDisplayable {
        
        let temp = Int(object.temperature.rounded())
        
        return CityDisplayable(cityName: object.city, cityWeatherIcon: object.symbol, cityTempRounded: temp)
    }
}
