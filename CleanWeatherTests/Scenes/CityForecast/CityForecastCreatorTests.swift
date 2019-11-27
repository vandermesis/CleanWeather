//
//  CityForecastCreatorTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityForecastCreatorTests: QuickSpec {

    override func spec() {

        var controller: UIViewController!

        describe("getting CityForecastController") {

            beforeEach {
                controller = CityForecastCreator().getController(with: Mock.cityWeather2)
            }

            afterEach {
                controller = nil
            }

            it("should return a valid controller") {
                expect(controller).to(beAKindOf(CityForecastController.self))
            }
        }
    }
}
