//
//  CityHistoricalDisplayableTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityHistoricalDisplayableTests: QuickSpec {

    override func spec() {

        var cityHistoricalDisplayable: CityHistoricalDisplayable!

        describe("init of cityHistoricalDisplayable") {

            beforeEach {
                cityHistoricalDisplayable = CityHistoricalDisplayable(object: Mock.cityHistorical3)
            }

            it("should return valid id string") {
                expect(cityHistoricalDisplayable.id).to(equal("05197501-e7b0-4bfd-84e0-e07038270f2d"))
            }

            it("should return valid city name string") {
                expect(cityHistoricalDisplayable.name).to(equal("Gdańsk"))
            }

            it("should return valid rounded temperature with degree sign") {
                expect(cityHistoricalDisplayable.temp).to(equal("-10°"))
            }

            it("should return valid symbol") {
                expect(cityHistoricalDisplayable.symbol).to(equal(WeatherSymbol.fog))
            }
        }
    }
}
