//
//  Mock+City.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

extension Mock {

    static let city1 = City(id: "13803CB5-42DA-46CD-8CE2-0B31C34CDB9F", name: "Katowice", latitude: 50.2605, longitude: 19.0159)
    static let city2 = City(id: "CED7073D-B70C-4F25-A5C7-817827112286", name: "New York", latitude: 40.730610, longitude: -73.935242)
    static let city3 = City(id: "9DA9F26C-579E-402A-88B0-E5138F79EF28", name: "Gdańsk", latitude: 54.372158, longitude: 18.638306)
    static let city4 = City(id: "627314F6-7720-4C92-A331-51B3A4E1C916", name: "Tokyo", latitude: 35.652832, longitude: 139.839478)
    static let city5 = City(id: "5E36DA9F-F4FA-4213-A54B-2D6902FC61B5", name: "Ljubliana", latitude: 50.2605, longitude: 19.0159)
    static let city6 = City(id: "F87F6F82-3B17-4964-B45C-FDA0A1469792", name: "Berlin", latitude: 40.730610, longitude: -73.935242)
    static let city7 = City(id: "5709509B-2333-409F-AC79-1EF65DD0E6B9", name: "Shanghai", latitude: 54.372158, longitude: 18.638306)
    static let city8 = City(id: "0D39A3C2-67BF-4EB7-8926-F3F1381A398E", name: "Sydney", latitude: 35.652832, longitude: 139.839478)

    static let allCities = [city1, city2, city3, city4, city5, city6, city7, city8]
}
