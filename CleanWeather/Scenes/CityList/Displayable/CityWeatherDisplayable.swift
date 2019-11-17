//
//  CityWeatherDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityWeatherDisplayable {
    
    let id: String
    let name: String
    let symbol: WeatherSymbol
    let temp: String
    
    init(object: CityWeather) {
        id = object.id
        name = object.city
        symbol = object.symbol
        temp = "\(Int(object.temperature.rounded()))°"
    }
}
