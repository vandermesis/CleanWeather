//
//  FakeCityForecastInteractor.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 26/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeCityForecastInteractor: CityForecastInteractor {

    var getCityDetailsCalled: Bool?
    var getCityForecastCalled: Bool?

    func getCityDetails() {
        getCityDetailsCalled = true
    }

    func getCityForecast() {
        getCityForecastCalled = true
    }
}
