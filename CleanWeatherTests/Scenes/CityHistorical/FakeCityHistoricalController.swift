//
//  FakeCityHistoricalController.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

@testable import CleanWeather

final class FakeCityHistoricalController: UIViewController, CityHistoricalPresentable {

    var displayCityDetailsCalled: CityCurrentDisplayable?
    var displayCityHistoricalCalled: CityHistoricalDisplayable?
    var displayFormattedDateDateCalled: String?

    func displayCityDetails(_ cityDetails: CityCurrentDisplayable) {
        displayCityDetailsCalled = cityDetails
    }

    func displayCityHistorical(_ cityHistorical: CityHistoricalDisplayable) {
        displayCityHistoricalCalled = cityHistorical
    }

    func displayFormattedDate(_ date: String) {
        displayFormattedDateDateCalled = date
    }
}
