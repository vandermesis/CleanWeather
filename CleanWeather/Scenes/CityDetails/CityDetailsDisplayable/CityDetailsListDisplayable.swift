//
//  CityDetailsListDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 21/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityDetailsListDisplayable {
    
    let id: String
    let hour: [String]
    let temp: [String]
    let precip: [String]
    let symbol: WeatherSymbol
    
    init(object: CityWeatherDetails) {
        id = object.id
        hour = object.hour
        temp = object.hourTemp.map { String($0.rounded()) }
        precip = object.hourPrecipProbability.map { String($0) }
        symbol = object.symbol
    }
}
