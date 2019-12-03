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
    var presentCityDetailsListCalled: [CityForecast]?

    func presentCityDetails(_ cityDetails: CityWeather) {
        presentCityDetailsCalled = cityDetails
    }

    func presentCityDetailsList(_ forecast: [CityForecast]) {
        presentCityDetailsListCalled = forecast
    }
}
