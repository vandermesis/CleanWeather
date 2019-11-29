//
//  IntExtensionTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 28/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class IntExtensionTests: QuickSpec {

    override func spec() {

        var int: Int!

        describe("int hour extension") {

            beforeEach {
                int = 9
            }

            it("should return value string in hour format HH:00") {
                expect(int.hourString).to(equal("9:00"))
            }
        }
    }
}
