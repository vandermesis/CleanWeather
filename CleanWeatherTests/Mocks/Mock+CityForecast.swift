//
//  Mock+CityForecast.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 27/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityForecast1 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", hour: 12, hourTemp: 10.34, hourPrecipProbability: 0.46, icon: "clear-day")
    static let cityForecast2 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", hour: 13, hourTemp: 11.47, hourPrecipProbability: 0.46, icon: "clear-day")
    static let cityForecast3 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", hour: 14, hourTemp: 12.57, hourPrecipProbability: 0.46, icon: "clear-day")
    static let cityForecast4 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", hour: 15, hourTemp: 13.68, hourPrecipProbability: 0.46, icon: "clear-day")
    static let cityForecast5 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", hour: 16, hourTemp: 14.89, hourPrecipProbability: 0.46, icon: "clear-day")

    static let cityForecast = [cityForecast1, cityForecast2, cityForecast3, cityForecast4, cityForecast5]
}
