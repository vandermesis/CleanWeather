//
//  Mock+CityForecast.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 27/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityForecast1 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", dateTimestamp: 1576756800, temperature: 10.34, precipProbability: 0.46, icon: "clear-day")
    static let cityForecast2 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", dateTimestamp: 1576756800, temperature: 11.47, precipProbability: 0.46, icon: "clear-day")
    static let cityForecast3 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", dateTimestamp: 1576756800, temperature: 12.57, precipProbability: 0.46, icon: "clear-day")
    static let cityForecast4 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", dateTimestamp: 1576756800, temperature: 13.68, precipProbability: 0.46, icon: "clear-day")
    static let cityForecast5 = CityForecast(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", dateTimestamp: 1576756800, temperature: 14.89, precipProbability: 0.46, icon: "clear-day")

    static let cityForecast = [cityForecast1, cityForecast2, cityForecast3, cityForecast4, cityForecast5]
}
