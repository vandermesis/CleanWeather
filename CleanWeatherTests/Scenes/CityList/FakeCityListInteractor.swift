//
//  FakeCityListInteractor.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 25/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

@testable import CleanWeather

final class FakeCityListInteractor: CityListInteractor {

    var getCityCalled: Bool?
    var didSelectCityCellIdCalled: String?

    func getCitiesWeather() {
        getCityCalled = true
    }

    func didSelectCityCell(id: String) {
        didSelectCityCellIdCalled = id
    }
}
