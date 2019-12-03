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

    var presentCityDetailsCalled: CityWeather?
    var presentCityHistoricalWeatherCalled: CityHistorical?

    func presentCityDetails(_ cityDetails: CityWeather) {
        presentCityDetailsCalled = cityDetails
    }

    func presentCityHistoricalWeather(_ cityHistorical: CityHistorical) {
        presentCityHistoricalWeatherCalled = cityHistorical
    }
}
