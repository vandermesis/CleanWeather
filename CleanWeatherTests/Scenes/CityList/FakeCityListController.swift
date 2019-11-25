//
//  FakeCityListController.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit
@testable import CleanWeather

final class FakeCityListController: UIViewController, CityListPresentable {

    var displayCityCalled: [CityWeatherDisplayable]?

    func displayCity(_ citiesWeather: [CityWeatherDisplayable]) {
        displayCityCalled = citiesWeather
    }
}
