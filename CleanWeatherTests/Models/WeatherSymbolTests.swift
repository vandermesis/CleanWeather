//
//  WeatherSymbolTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 28/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class WeatherSymbolTests: QuickSpec {

    override func spec() {

        var weatherSymbol: WeatherSymbol!

        describe("init of WeatherSymbol") {

            context("with clear-day string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "clear-day")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("sun.max"))
                }
            }

            context("with clear-night string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "clear-night")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("moon"))
                }
            }

            context("with partly-cloudy-day string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "partly-cloudy-day")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("cloud.sun"))
                }
            }

            context("with partly-cloudy-night string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "partly-cloudy-night")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("cloud.moon"))
                }
            }

            context("with cloudy string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "cloudy")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("cloud"))
                }
            }

            context("with fog string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "fog")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("cloud.fog"))
                }
            }

            context("with rain string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "rain")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("cloud.rain"))
                }
            }

            context("with sleet string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "sleet")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("cloud.sleet"))
                }
            }

            context("with snow string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "snow")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("cloud.snow"))
                }
            }

            context("with wind string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "wind")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("wind"))
                }
            }

            context("with umbrella string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "umbrella")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("umbrella"))
                }
            }

            context("with isEmpty string") {

                beforeEach {
                    weatherSymbol = WeatherSymbol(rawValue: "isEmpty")
                }

                it("should return valid icon name") {
                    expect(weatherSymbol.icon).to(equal("nosign"))
                }
            }

            //FIXME: Possible bug. Can't test case with invalid string. App crashes.
//            context("with invalid string") {
//
//                beforeEach {
//                    weatherSymbol = WeatherSymbol(rawValue: "invalidString")
//                }
//
//                it("should return isEmpty enum case") {
//                    expect(weatherSymbol.icon).to(equal("nosign"))
//                }
//            }
        }
    }
}
