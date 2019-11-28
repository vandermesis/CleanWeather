//
//  ErrorExtensionTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 28/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class ErrorExtensionTests: QuickSpec {

    override func spec() {

        var error: Error!

        describe("error user friendly message") {

            context("on decoding error") {

                beforeEach {
                    //FIXME: How to init DecodingError?
                }

                it("should return valid message string") {
                    //                    expect(error.userFriendlyMessage).to(equal("Decoding Error"))
                }
            }

            context("on app error") {

                beforeEach {
                    error = AppError(message: "App Error")
                }

                it("should return app error message") {
                    expect(error.userFriendlyMessage).to(equal("App Error"))
                }
            }

            context("on unit test error") {

                beforeEach {
                    error = UnitTestError()
                }

                it("should return valid message string") {
                    expect(error.userFriendlyMessage).to(equal("Unit Test Error"))
                }
            }

            context("on any other errors") {

                beforeEach {
                    //FIXME: How to init other errors?
                }

                it("should return valid message string") {
//                    expect(error.userFriendlyMessage).to(equal("Unknown Error"))
                }
            }
        }
    }
}
