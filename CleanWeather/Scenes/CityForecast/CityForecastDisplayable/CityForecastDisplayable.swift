//
//  CityForecastDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 20/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityForecastDisplayable {
    
    let id: String
    let name: String
    let temp: String
    let symbol: WeatherSymbol
    
    init(object: CityWeather) {
        id = object.id
        name = object.city
        temp = "\(Int(object.temperature.rounded()))°"
        symbol = object.symbol
    }
}
