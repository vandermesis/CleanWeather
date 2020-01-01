//
//  CityCurrentDisplayableTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityCurrentDisplayableTests: QuickSpec {

    override func spec() {

        var cityCurrentDisplayable: CityCurrentDisplayable!

        describe("init of CityCurrentDisplayable") {

            beforeEach {
                cityCurrentDisplayable = CityCurrentDisplayable(object: Mock.cityWeather4)
            }

            it("should return valid id string") {
                expect(cityCurrentDisplayable.id).to(equal("627314F6-7720-4C92-A331-51B3A4E1C916"))
            }

            it("should return valid city name string") {
                expect(cityCurrentDisplayable.name).to(equal("Tokio"))
            }

            it("should return valid rounded temperature with degree sign") {
                expect(cityCurrentDisplayable.temp).to(equal("36°"))
            }

            it("should return valid symbol") {
                expect(cityCurrentDisplayable.symbol).to(equal(WeatherSymbol.rain))
            }
        }
    }
}
