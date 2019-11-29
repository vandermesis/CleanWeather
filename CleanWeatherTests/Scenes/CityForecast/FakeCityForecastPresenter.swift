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

    var displayCityDetailsCalled: CityWeather?
    var displayCityDetailsListCalled: [CityForecast]?

    func displayCityDetails(_ cityDetails: CityWeather) {
        displayCityDetailsCalled = cityDetails
    }

    func displayCityDetailsList(_ forecast: [CityForecast]) {
        displayCityDetailsListCalled = forecast
    }
}
