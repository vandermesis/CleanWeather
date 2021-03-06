//
//  CityForecastDisplayableTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 27/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityForecastDisplayableTests: QuickSpec {

    override func spec() {

        var cityForecastDisplayable: CityForecastDisplayable!

        describe("init of CityForecastDisplayable") {

            beforeEach {
                cityForecastDisplayable = CityForecastDisplayable(object: Mock.cityWeather1)
            }

            it("should return valid id string") {
                expect(cityForecastDisplayable.id).to(equal("13803CB5-42DA-46CD-8CE2-0B31C34CDB9F"))
            }

            it("should return valid city name string") {
                expect(cityForecastDisplayable.name).to(equal("Katowice"))
            }

            it("should return valid rounded temperature with degree sign") {
                expect(cityForecastDisplayable.temp).to(equal("23°"))
            }

            it("should return valid symbol") {
                expect(cityForecastDisplayable.symbol).to(equal(WeatherSymbol.clearDay))
            }
        }
    }
}
