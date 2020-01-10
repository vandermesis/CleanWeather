//
//  CityHourlyForecastListDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 21/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityHourlyForecastListDisplayable {

    let dateFormatter = DateFormatterHelper.shared
    let coordinates: String
    let hour: String
    let temp: String
    let precip: String
    let symbol: WeatherSymbol
    
    init(object: CityHourlyForecast) {
        coordinates = object.coordinates
        hour = dateFormatter.getTimeStringFromUnixTime(timeIntervalSince1970: object.dateTimestamp,
                                                       timezone: .CET,
                                                       format: .hour)
        temp = object.temperature.temperatureString
        precip = object.precipProbability.percentString
        symbol = object.symbol
    }
}
