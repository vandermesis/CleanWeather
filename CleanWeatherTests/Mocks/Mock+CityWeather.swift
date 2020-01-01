//
//  Mock+CityWeather.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityWeather1 = CityWeather(id: "13803CB5-42DA-46CD-8CE2-0B31C34CDB9F", city: "Katowice", latitude: 50, longitude: 10, temperature: 23.12, icon: "clear-day")
    static let cityWeather2 = CityWeather(id: "CED7073D-B70C-4F25-A5C7-817827112286", city: "New York", latitude: 40, longitude: 5, temperature: 12.12, icon: "clear-night")
    static let cityWeather3 = CityWeather(id: "9DA9F26C-579E-402A-88B0-E5138F79EF28", city: "Gdańsk", latitude: 30, longitude: 20, temperature: -10.45, icon: "fog")
    static let cityWeather4 = CityWeather(id: "627314F6-7720-4C92-A331-51B3A4E1C916", city: "Tokio", latitude: 20, longitude: 30, temperature: 35.91, icon: "rain")

    static let citiesWeather = [cityWeather1, cityWeather2, cityWeather3, cityWeather4]
}
