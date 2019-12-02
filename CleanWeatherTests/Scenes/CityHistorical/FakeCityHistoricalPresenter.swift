//
//  FakeCityHistoricalPresenter.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

@testable import CleanWeather

final class FakeCityHistoricalPresenter: FakePresenter, CityHistoricalPresenter {

    var displayCityDetailsCalled: CityWeather?
    var displayCityHistoricalWeatherCalled: CityHistorical?

    func displayCityDetails(_ cityDetails: CityWeather) {
        displayCityDetailsCalled = cityDetails
    }

    func displayCityHistoricalWeather(_ cityHistorical: CityHistorical) {
        displayCityHistoricalWeatherCalled = cityHistorical
    }
}
