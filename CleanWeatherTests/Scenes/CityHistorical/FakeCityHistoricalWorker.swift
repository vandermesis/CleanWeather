//
//  FakeCityHistoricalWorker.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

@testable import CleanWeather

final class FakeCityHistoricalWorker: CityHistoricalWorker {

    var fetchCityHistoricalWeatherCalled: Bool?
    var fetchCityHistoricalWeatherCityDetailsCalled: CityWeather?
    var fetchCityHistoricalWeatherDateCalled: Date?
    var fetchCityHistoricalWeatherCompletion: FetchHistoricalCompletion?

    func fetchCityHistoricalWeather(cityDetails: CityWeather, date: Date, completion: FetchHistoricalCompletion?) {
        fetchCityHistoricalWeatherCalled = true
        fetchCityHistoricalWeatherCityDetailsCalled = cityDetails
        fetchCityHistoricalWeatherDateCalled = date
        fetchCityHistoricalWeatherCompletion = completion
    }
}
