//
//  FakeCityListWorker.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeCityListWorker: CityListWorker {

    var fetchCityWeatherCalled: Bool?
    var fetchCityWeatherCompletion: FetchWeatherCompletion?

    func fetchCityWeather(completion: FetchWeatherCompletion?) {
        fetchCityWeatherCalled = true
        fetchCityWeatherCompletion = completion
    }
}
