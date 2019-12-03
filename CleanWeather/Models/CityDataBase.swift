//
//  CityDataBase.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CityDataBase {

    static let city1 = City(id: "fb812bd3-8bbd-47cc-92f5-fb6205bf0ccd", name: "Katowice", lat: 50.2605, lon: 19.0159)
    static let city2 = City(id: "c1f2934e-b2f4-47d2-961f-22c72d2411b5", name: "Nowy Jork", lat: 40.730610, lon: -73.935242)
    static let city3 = City(id: "05197501-e7b0-4bfd-84e0-e07038270f2d", name: "Gdańsk", lat: 54.372158, lon: 18.638306)
    static let city4 = City(id: "00b66ad7-e6ab-47e3-bbef-9e0ee00952c6", name: "Tokio", lat: 35.652832, lon: 139.839478)

    static let cityDB = [city1, city2, city3, city4]
}
