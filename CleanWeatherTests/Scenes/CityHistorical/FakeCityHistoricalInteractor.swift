//
//  FakeCityHistoricalInteractor.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

@testable import CleanWeather

final class FakeCityHistoricalInteractor: CityHistoricalInteractor {

    var getCityDetailsCalled: Bool?
    var getCityHistoricalWeatherDateCalled: Date?
    var didSelectDateDateCalled: Date?

    func getCityDetails() {
        getCityDetailsCalled = true
    }

    func getCityHistoricalWeather(date: Date) {
        getCityHistoricalWeatherDateCalled = date
    }

    func didSelectDate(date: Date) {
        didSelectDateDateCalled = date
    }
}
