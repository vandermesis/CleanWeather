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

    var fetchCurrentWeatherForCityCalled: Bool?
    var fetchCurrentWeatherForCityCoordinatesCalled: String?
    var fetchCurrentWeatherForCityCompletion: FetchWeatherResponseCompletion?
    var fetchForecastWeatherForCityCalled: Bool?
    var fetchForecastWeatherForCityCoordinatesCalled: String?
    var fetchForecastWeatherForCityCompletion: FetchForecastResponseCompletion?
    var fetchHistoricalWeatherForCityCalled: Bool?
    var fetchHistoricalWeatherForCityCoordinatesCalled: String?
    var fetchHistoricalWeatherForCityDateCalled: Double?
    var fetchHistoricalWeatherForCityCompletion: FetchHistoricalResponseCompletion?
    var fetchCitiesCalled: Bool?
    var fetchCitiesCompletion: FetchCitiesResponseCompletion?

    func fetchCurrentWeatherForCity(coordinates: String, completion: FetchWeatherResponseCompletion?) {
        fetchCurrentWeatherForCityCalled = true
        fetchCurrentWeatherForCityCoordinatesCalled = coordinates
        fetchCurrentWeatherForCityCompletion = completion
    }

    func fetchForecastWeatherForCity(coordinates: String, completion: FetchForecastResponseCompletion?) {
        fetchForecastWeatherForCityCalled = true
        fetchForecastWeatherForCityCoordinatesCalled = coordinates
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
