//
//  FakeCityListRouter.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeCityListRouter: CityListRouter {

    var navigateToCityDetailsCityWeatherCalled: CityWeather?

    func navigateToCityDetails(cityWeather: CityWeather) {
        navigateToCityDetailsCityWeatherCalled = cityWeather
    }
}
