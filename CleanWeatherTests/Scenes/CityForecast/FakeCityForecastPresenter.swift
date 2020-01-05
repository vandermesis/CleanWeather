//
//  FakeCityForecastPresenter.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 26/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

@testable import CleanWeather

final class FakeCityForecastPresenter: FakePresenter, CityForecastPresenter {

    var presentCityDetailsCalled: CityWeather?
    var presentCityForecastListCalled: CityForecast?

    func presentCityDetails(_ cityDetails: CityWeather) {
        presentCityDetailsCalled = cityDetails
    }

    func presentCityForecastList(_ forecast: CityForecast) {
        presentCityForecastListCalled = forecast
    }
}
