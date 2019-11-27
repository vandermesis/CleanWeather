//
//  FakeWeatherNetworking.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeWeatherNetworking: WeatherNetworking {

    var fetchCurrentWeatherForAllCitiesCalled: Bool?
    var fetchCurrentWeatherForAllCitiesCompletion: FetchWeatherCompletion?
    var fetchForecastWeatherForCityCalled: Bool?
    var fetchForecastWeatherForCityIdCalled: String?
    var fetchForecastWeatherForCityCompletion: FetchForecastCompletion?

    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?) {
        fetchCurrentWeatherForAllCitiesCalled = true
        fetchCurrentWeatherForAllCitiesCompletion = completion
    }

    func fetchForecastWeatherForCity(id: String, completion: FetchForecastCompletion?) {
        fetchForecastWeatherForCityCalled = true
        fetchForecastWeatherForCityIdCalled = id
        fetchForecastWeatherForCityCompletion = completion
    }
}
