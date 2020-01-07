//
//  CityDailyForecastListDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

struct CityDailyForecastListDisplayable {

    let dateFormatter = DateFormatterHelper.shared
    let coordinates: String
    let day: String
    let minTemp: String
    let maxTemp: String
    let precip: String
    let symbol: WeatherSymbol

    init(object: CityDailyForecast) {
        coordinates = object.coordinates
        day = dateFormatter.getTimeStringFromUnixTime(timeIntervalSince1970: object.dateTimestamp,
                                                      timezone: .CET,
                                                      format: .day)
        maxTemp = object.maxTemperature.temperatureString
        minTemp = object.minTemperature.temperatureString
        precip = object.precipProbability.percentString
        symbol = object.symbol
    }
}
