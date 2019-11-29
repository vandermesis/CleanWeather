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
    var fetchCityHourDetailsListIdCalled: String?
    var fetchCityHourDetailsListCompletion: FetchForecastCompletion?

    func fetchCityHourDetailsList(id: String, completion: FetchForecastCompletion?) {
        fetchCityHourDetailsListCalled = true
        fetchCityHourDetailsListIdCalled = id
        fetchCityHourDetailsListCompletion = completion
    }
}
