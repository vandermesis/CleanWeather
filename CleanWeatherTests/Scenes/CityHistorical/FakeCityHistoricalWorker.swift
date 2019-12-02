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

    var fetchCityHistoricalWeatherIdCalled: String?
    var fetchCityHistoricalWeatherDateCalled: Date?
    var fetchCityHistoricalWeatherCompletion: FetchHistoricalCompletion?

    func fetchCityHistoricalWeather(id: String, date: Date, completion: FetchHistoricalCompletion?) {
        fetchCityHistoricalWeatherIdCalled = id
        fetchCityHistoricalWeatherDateCalled = date
        fetchCityHistoricalWeatherCompletion = completion
    }
}
