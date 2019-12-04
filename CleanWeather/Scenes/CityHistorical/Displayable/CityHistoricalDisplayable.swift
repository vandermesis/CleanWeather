//
//  CityHistoricalDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityHistoricalDisplayable {

    let id: String
    let name: String
    let temp: String
    let symbol: WeatherSymbol

    init(object: CityHistorical) {
        id = object.id
        name = object.city
        temp = object.temperature.temperatureString
        symbol = object.symbol
    }
}
