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
                expect(displayable.id).to(equal("9DA9F26C-579E-402A-88B0-E5138F79EF28"))
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
