//
//  CityForecastListDisplayableTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 27/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityForecastListDisplayableTests: QuickSpec {

    override func spec() {

        var cityForecastListDisplayable: CityHourlyForecastListDisplayable!

        describe("init of CityHourlyForecastListDisplayable") {

            beforeEach {
                cityForecastListDisplayable = CityHourlyForecastListDisplayable(object: Mock.cityHourlyForecast4)
            }

            it("should return valid coordinates string") {
                expect(cityForecastListDisplayable.coordinates).to(equal("c1f2934e-b2f4-47d2-961f-22c72d2411b5"))
            }

            it("should return valid hour string") {
                expect(cityForecastListDisplayable.hour).to(equal("13"))
            }

            it("should return valid rounded temp with degree sign") {
                expect(cityForecastListDisplayable.temp).to(equal("14°"))
            }

            it("should return valid precip percentage with percent sign") {
                expect(cityForecastListDisplayable.precip).to(equal("46%"))
            }

            it("should return valid symbol") {
                expect(cityForecastListDisplayable.symbol).to(equal(WeatherSymbol.clearDay))
            }
        }
    }
}
