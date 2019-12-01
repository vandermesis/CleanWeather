//
//  CityForecastListDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 21/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityForecastListDisplayable {
    
    let id: String
    let hour: String
    let temp: String
    let precip: String
    let symbol: WeatherSymbol
    
    init(object: CityForecast) {
        id = object.id
        hour = object.hour.hourString
        temp = object.hourTemp.temperatureString
        precip = object.hourPrecipProbability.percentString
        symbol = object.symbol
    }
}
