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
    var fetchHistoricalWeatherForCityCoordinatesCalled: String?
    var fetchHistoricalWeatherForCityDateCalled: Double?
    var fetchHistoricalWeatherForCityCompletion: FetchHistoricalResponseCompletion?
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

    func fetchHistoricalWeatherForCity(coordinates: String, date: Double, completion: FetchHistoricalResponseCompletion?) {
        fetchHistoricalWeatherForCityCalled = true
        fetchHistoricalWeatherForCityCoordinatesCalled = coordinates
        fetchHistoricalWeatherForCityDateCalled = date
        fetchHistoricalWeatherForCityCompletion = completion
    }

    func fetchCities(completion: FetchCitiesResponseCompletion?) {
        fetchCitiesCalled = true
        fetchCitiesCompletion = completion
    }
}
