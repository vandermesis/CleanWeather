//
//  CityListCreatorTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityListCreatorTests: QuickSpec {

    override func spec() {

        var controller: UIViewController?

        describe("getting CityListController") {

            beforeEach {
                controller = CityListCreator().getController()
            }

            afterEach {
                controller = nil
            }

            it("should return valid controller") {
                expect(controller).to(beAKindOf(CityListController.self))
            }
        }
    }
}
