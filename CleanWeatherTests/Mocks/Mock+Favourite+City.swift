//
//  Mock+Favourite+City.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let favouriteCity1 = City(id: "13803CB5-42DA-46CD-8CE2-0B31C34CDB9F", name: "Katowice", latitude: 50.2605, longitude: 19.0159)
    static let favouriteCity2 = City(id: "CED7073D-B70C-4F25-A5C7-817827112286", name: "New York", latitude: 40.730610, longitude: -73.935242)
    static let favouriteCity3 = City(id: "9DA9F26C-579E-402A-88B0-E5138F79EF28", name: "Gdańsk", latitude: 54.372158, longitude: 18.638306)
    static let favouriteCity4 = City(id: "627314F6-7720-4C92-A331-51B3A4E1C916", name: "Tokyo", latitude: 35.652832, longitude: 139.839478)

    static let favouriteCities = [favouriteCity1, favouriteCity2, favouriteCity3, favouriteCity4]
}
