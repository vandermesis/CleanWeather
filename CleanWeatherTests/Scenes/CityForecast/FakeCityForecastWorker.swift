//
//  FakeCityForecastWorker.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 26/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeCityForecastWorker: CityForecastWorker {

    var fetchCityForecastCalled: Bool?
    var fetchCityForecastCoordinatesCalled: String?
    var fetchCityForecastCompletion: FetchForecastCompletion?

    func fetchCityForecast(coordinates: String, completion: FetchForecastCompletion?) {
        fetchCityForecastCalled = true
        fetchCityForecastCoordinatesCalled = coordinates
        fetchCityForecastCompletion = completion
    }
}
