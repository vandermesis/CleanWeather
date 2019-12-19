//
//  FakeWeatherNetworking.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

@testable import CleanWeather

final class FakeWeatherNetworking: WeatherNetworking {

    var fetchCurrentWeatherForAllCitiesCalled: Bool?
    var fetchCurrentWeatherForAllCitiesCompletion: FetchWeatherCompletion?
    var fetchForecastWeatherForCityCalled: Bool?
    var fetchForecastWeatherForCityIdCalled: String?
    var fetchForecastWeatherForCityCompletion: FetchForecastResponseCompletion?
    var fetchHistoricalWeatherForCityCalled: Bool?
    var fetchHistoricalWeatherForCityIdCalled: String?
    var fetchHistoricalWeatherForCityDateCalled: Double?
    var fetchHistoricalWeatherForCityCompletion: FetchHistoricalCompletion?
    var fetchCitiesCalled: Bool?
    var fetchCitiesCompletion: FetchCitiesResponseCompletion?

    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?) {
        fetchCurrentWeatherForAllCitiesCalled = true
        fetchCurrentWeatherForAllCitiesCompletion = completion
    }

    func fetchForecastWeatherForCity(coordinates id: String, completion: FetchForecastResponseCompletion?) {
        fetchForecastWeatherForCityCalled = true
        fetchForecastWeatherForCityIdCalled = id
        fetchForecastWeatherForCityCompletion = completion
    }

    func fetchHistoricalWeatherForCity(id: String, date: Double, completion: FetchHistoricalCompletion?) {
        fetchHistoricalWeatherForCityCalled = true
        fetchHistoricalWeatherForCityIdCalled = id
        fetchHistoricalWeatherForCityDateCalled = date
        fetchHistoricalWeatherForCityCompletion = completion
    }

    func fetchCities(completion: FetchCitiesResponseCompletion?) {
        fetchCitiesCalled = true
        fetchCitiesCompletion = completion
    }
}
