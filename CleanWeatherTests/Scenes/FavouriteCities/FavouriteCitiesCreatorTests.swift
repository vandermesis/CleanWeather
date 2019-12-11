//
//  FavouriteCitiesCreatorTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class FavouriteCitiesCreatorTests: QuickSpec {

    override func spec() {

        var controller: UIViewController!

        describe("getting FavouriteCitiesController") {

            beforeEach {
                controller = FavouriteCitiesCreator().getController()
            }

            afterEach {
                controller = nil
            }

            it("should return valid controller") {
                expect(controller).toEventually(beAKindOf(FavouriteCitiesController.self))
            }
        }
    }
}
