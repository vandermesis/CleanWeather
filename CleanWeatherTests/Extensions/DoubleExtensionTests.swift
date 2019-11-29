//
//  DoubleExtensionTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 28/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class DoubleExtensionTests: QuickSpec {

    override func spec() {

        var double: Double!

        describe("double temperatureString extension") {

            context("on positive value") {

                beforeEach {
                    double = 3.141592
                }

                it("should return rounded value string with degree sign") {
                    expect(double.temperatureString).to(equal("3°"))
                }
            }

            context("on negative value") {

                beforeEach {
                    double = -23.49584
                }

                it("should return rounded negative value with degree sign") {
                    expect(double.temperatureString).to(equal("-23°"))
                }
            }

            context("on near zero negative value") {

                beforeEach {
                    double = -0.14
                }

                it("should return rounded negative value with degree sign") {
                    expect(double.temperatureString).to(equal("0°"))
                }
            }
        }

        describe("double percentString extension") {

            beforeEach {
                double = 0.01
            }

            it("should return percentage value string with percent sign") {
                expect(double.percentString).to(equal("1%"))
            }
        }
    }
}
