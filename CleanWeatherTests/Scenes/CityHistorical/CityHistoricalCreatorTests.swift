//
//  CityHistoricalCreatorTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityHistoricalCreatorTests: QuickSpec {

    override func spec() {

        var controller: UIViewController!

        describe("getting CityHistoricalController") {

            beforeEach {
                controller = CityHistoricalCreator().getController(with: Mock.cityWeather1)
            }

            afterEach {
                controller = nil
            }

            it("should return a valid controller") {
                expect(controller).to(beAKindOf(CityHistoricalController.self))
            }
        }
    }
}
