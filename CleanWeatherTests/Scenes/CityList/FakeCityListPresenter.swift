//
//  FakeCityListPresenter.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

@testable import CleanWeather

final class FakeCityListPresenter: FakePresenter, CityListPresenter {

    var presentCitiesWeatherCalled: [CityWeather]?

    func presentCitiesWeather(citiesWeather: [CityWeather]) {
        presentCitiesWeatherCalled = citiesWeather
    }
}
