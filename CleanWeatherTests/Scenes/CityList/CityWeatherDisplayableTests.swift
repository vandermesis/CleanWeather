//
//  CityWeatherDisplayableTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 26/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityWeatherDisplayableTests: QuickSpec {

    override func spec() {

        var displayable: CityWeatherDisplayable!

        describe("init of CityWeatherDisplayable") {

            beforeEach {
                displayable = CityWeatherDisplayable(object: Mock.cityWeather3)
            }

            it("should return valid id string") {
                expect(displayable.id).to(equal("05197501-e7b0-4bfd-84e0-e07038270f2d"))
            }

            it("should return valid name string") {
                expect(displayable.name).to(equal("Gdańsk"))
            }

            it("should return valid temperature string") {
                expect(displayable.temp).to(equal("-10°"))
            }

            it("should return valid symbol") {
                expect(displayable.symbol).to(equal(WeatherSymbol.fog))
            }
        }
    }
}
