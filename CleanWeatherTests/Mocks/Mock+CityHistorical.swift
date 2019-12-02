//
//  Mock+CityHistorical.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let cityHistorical1 = CityHistorical(id: "fb812bd3-8bbd-47cc-92f5-fb6205bf0ccd", city: "Katowice", temperature: 12.12, icon: "clear-day")
    static let cityHistorical2 = CityHistorical(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", city: "Nowy Jork", temperature: 12.12, icon: "clear-night")
    static let cityHistorical3 = CityHistorical(id: "05197501-e7b0-4bfd-84e0-e07038270f2d", city: "Gdańsk", temperature: -10.45, icon: "fog")
    static let cityHistorical4 = CityHistorical(id: "00b66ad7-e6ab-47e3-bbef-9e0ee00952c6", city: "Tokio", temperature: 35.91, icon: "rain")

    static let citiesHistorical = [cityHistorical1, cityHistorical2, cityHistorical3, cityHistorical4]
}
