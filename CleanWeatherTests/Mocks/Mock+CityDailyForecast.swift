//
//  Mock+CityDailyForecast.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 05/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityDailyForecast1 = CityDailyForecast(coordinates: "20,10", dateTimestamp: 1576756800, maxTemperature: 10, minTemperatyre: 5, precipProbability: 0.3, icon: "clear-day")
    static let cityDailyForecast2 = CityDailyForecast(coordinates: "20,10", dateTimestamp: 1576756800, maxTemperature: 11, minTemperatyre: 6, precipProbability: 0.4, icon: "clear-day")
    static let cityDailyForecast3 = CityDailyForecast(coordinates: "20,10", dateTimestamp: 1576756800, maxTemperature: 12, minTemperatyre: 7, precipProbability: 0.5, icon: "clear-day")
    static let cityDailyForecast4 = CityDailyForecast(coordinates: "20,10", dateTimestamp: 1576756800, maxTemperature: 13, minTemperatyre: 8, precipProbability: 0.6, icon: "clear-day")
    static let cityDailyForecast5 = CityDailyForecast(coordinates: "20,10", dateTimestamp: 1576756800, maxTemperature: 14, minTemperatyre: 9, precipProbability: 0.7, icon: "clear-day")

    static let cityDailyForecast = [cityDailyForecast1, cityDailyForecast2, cityDailyForecast3, cityDailyForecast4, cityDailyForecast5]
}
