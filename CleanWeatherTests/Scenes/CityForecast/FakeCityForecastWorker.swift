//
//  FakeCityForecastWorker.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 26/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeCityForecastWorker: CityForecastWorker {

    var fetchCityHourDetailsListCalled: Bool?
    var fetchCityHourDetailsListCoordinatesCalled: String?
    var fetchCityHourDetailsListCompletion: FetchForecastCompletion?

    func fetchCityHourDetailsList(coordinates: String, completion: FetchForecastCompletion?) {
        fetchCityHourDetailsListCalled = true
        fetchCityHourDetailsListCoordinatesCalled = coordinates
        fetchCityHourDetailsListCompletion = completion
    }
}
