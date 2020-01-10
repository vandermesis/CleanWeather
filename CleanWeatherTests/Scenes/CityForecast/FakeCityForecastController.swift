//
//  FakeCityForecastController.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 26/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

@testable import CleanWeather

final class FakeCityForecastController: UIViewController, CityForecastPresentable {

    var displayCityDetailsCalled: CityForecastDisplayable?
    var displayCityForecastHourlyForecastCalled: [CityHourlyForecastListDisplayable]?
    var displayCityForecastDailyForecastCalled: [CityDailyForecastListDisplayable]?

    func displayCityDetails(_ cityDetails: CityForecastDisplayable) {
        displayCityDetailsCalled = cityDetails
    }

    func displayCityForecast(hourlyForecast: [CityHourlyForecastListDisplayable],
                             dailyForecast: [CityDailyForecastListDisplayable]) {
        displayCityForecastHourlyForecastCalled = hourlyForecast
        displayCityForecastDailyForecastCalled = dailyForecast
    }
}
