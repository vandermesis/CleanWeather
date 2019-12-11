//
//  FavouriteCitiesListDisplayableTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class FavouriteCitiesListDisplayableTests: QuickSpec {

    override func spec() {

        var displayable: FavouriteCitiesListDisplayable!

        describe("init of FavouriteCitiesListDisplayable") {
            beforeEach {
                displayable = FavouriteCitiesListDisplayable(city: Mock.city7, isFavourite: true)
            }

            it("should return valid id string") {
                expect(displayable.id).to(equal("5709509B-2333-409F-AC79-1EF65DD0E6B9"))
            }

            it("should return valid name string") {
                expect(displayable.name).to(equal("Shanghai"))
            }

            it("should return valid isFavourite state") {
                expect(displayable.isFavourite).to(beTrue())
            }

            it("should return UIImage for favouriteIcon") {
                expect(displayable.favouriteIcon).to(beAKindOf(UIImage.self))
            }
        }
    }
}
