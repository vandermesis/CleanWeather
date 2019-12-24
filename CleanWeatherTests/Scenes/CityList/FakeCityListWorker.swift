//
//  FakeCityListWorker.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeCityListWorker: CityListWorker {

    var fetchFavouriteCitiesCalled: Bool?
    var fetchFavouriteCitiesCompletion: FetchFavouriteCitiesCompletion?
    var fetchCitiesWeatherCalled: Bool?
    var fetchCitiesWeatherCitiesCalled: [City]?
    var fetchCitiesWeatherCompletion: FetchWeatherCompletion?

    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?) {
        fetchFavouriteCitiesCalled = true
        fetchFavouriteCitiesCompletion = completion
    }

    func fetchCitiesWeather(cities: [City], completion: FetchWeatherCompletion?) {
        fetchCitiesWeatherCalled = true
        fetchCitiesWeatherCitiesCalled = cities
        fetchCitiesWeatherCompletion = completion
    }
}
