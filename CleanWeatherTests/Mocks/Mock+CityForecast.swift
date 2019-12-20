//
//  Mock+CityForecast.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 27/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityForecast1 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", forecastDateTimestamp: 1576756800, forecastHourTemp: 10.34, forecastHourPrecipProbability: 0.46, icon: "clear-day")
    static let cityForecast2 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", forecastDateTimestamp: 1576756800, forecastHourTemp: 11.47, forecastHourPrecipProbability: 0.46, icon: "clear-day")
    static let cityForecast3 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", forecastDateTimestamp: 1576756800, forecastHourTemp: 12.57, forecastHourPrecipProbability: 0.46, icon: "clear-day")
    static let cityForecast4 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", forecastDateTimestamp: 1576756800, forecastHourTemp: 13.68, forecastHourPrecipProbability: 0.46, icon: "clear-day")
    static let cityForecast5 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", forecastDateTimestamp: 1576756800, forecastHourTemp: 14.89, forecastHourPrecipProbability: 0.46, icon: "clear-day")

    static let cityForecast = [cityForecast1, cityForecast2, cityForecast3, cityForecast4, cityForecast5]
}
