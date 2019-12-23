//
//  Mock+CityWeather.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityWeather1 = CityWeather(id: "fb812bd3-8bbd-47cc-92f5-fb6205bf0ccd", city: "Katowice", latitude: 50, longitude: 10, temperature: 23.12, icon: "clear-day")
    static let cityWeather2 = CityWeather(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", city: "Nowy Jork", latitude: 40, longitude: 5, temperature: 12.12, icon: "clear-night")
    static let cityWeather3 = CityWeather(id: "05197501-e7b0-4bfd-84e0-e07038270f2d", city: "Gdańsk", latitude: 30, longitude: 20, temperature: -10.45, icon: "fog")
    static let cityWeather4 = CityWeather(id: "00b66ad7-e6ab-47e3-bbef-9e0ee00952c6", city: "Tokio", latitude: 20, longitude: 30, temperature: 35.91, icon: "rain")

    static let citiesWeather = [cityWeather1, cityWeather2, cityWeather3, cityWeather4]
}
