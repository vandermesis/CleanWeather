//
//  FakeCityForecastRouter.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 26/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeCityForecastRouter: CityForecastRouter {

    var navigateToCityHistoricalCityWeatherCalled: CityWeather?

    func navigateToCityHistorical(cityWeather: CityWeather) {
        navigateToCityHistoricalCityWeatherCalled = cityWeather
    }
}
