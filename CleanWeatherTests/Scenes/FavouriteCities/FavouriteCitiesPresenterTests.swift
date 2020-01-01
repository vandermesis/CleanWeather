//
//  FavouriteCitiesPresenterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class FavouriteCitiesPresenterTests: QuickSpec {

    override func spec() {

        var presenter: FavouriteCitiesPresenterImpl<FakeFavouriteCitiesController>!
        var controller: FakeFavouriteCitiesController!

        beforeEach {
            presenter = FavouriteCitiesPresenterImpl<FakeFavouriteCitiesController>()
            controller = FakeFavouriteCitiesController()
            presenter.controller = controller
        }

        describe("presenting cities") {

            let displayableFavourites = Mock.favouriteCities.map { (FavouriteCitiesListDisplayable(city: $0, isFavourite: true)) }

            context("when user is not searching for cities") {

                context("and all cities scope is selected") {

                    beforeEach {
                        presenter.presentCities(allCities: Mock.allCities,
                                                favourites: Mock.favouriteCities)
                    }

                    it("should call controller to display cities") {
                        expect(controller.displayCitiesCalled).to(beTrue())
                    }

                    it("should display all cities from all cities") {
                        expect(controller.displayCitiesFavouriteCitiesDisplayable?.count).to(equal(Mock.allCities.count))
                    }

                    it("should display all cities from favourite cities") {
                        expect(controller.displayCitiesFavouriteCitiesDisplayable).to(contain(displayableFavourites))
                    }
                }

                context("and favourite cities scope is selected") {

                    beforeEach {
                        presenter.presentCities(allCities: Mock.allCities,
                                                favourites: Mock.favouriteCities,
                                                filteringPhrase: "",
                                                favouriteState: true)
                    }

                    it("should call controller to display cities") {
                        expect(controller.displayCitiesCalled).to(beTrue())
                    }

                    it("should not display all cities") {
                        expect(controller.displayCitiesFavouriteCitiesDisplayable?.count).notTo(equal(Mock.allCities.count))
                    }

                    it("should display all favourite cities") {
                        expect(controller.displayCitiesFavouriteCitiesDisplayable).to(contain(displayableFavourites))
                    }
                }
            }

            context("when user is searching for cities") {

                context("and all cities scope is selected") {

                    beforeEach {
                        presenter.presentCities(allCities: Mock.allCities,
                                                favourites: Mock.favouriteCities,
                                                filteringPhrase: "Kat",
                                                favouriteState: false)
                    }

                    it("should call controller to display cities") {
                        expect(controller.displayCitiesCalled).to(beTrue())
                    }

                    it("should display only one filtered city") {
                        expect(controller.displayCitiesFavouriteCitiesDisplayable?.count).to(equal(1))
                    }

                    it("should display city containing user search text") {
                        expect(controller.displayCitiesFavouriteCitiesDisplayable).to(contain(FavouriteCitiesListDisplayable(city: Mock.city1,
                                                                                                                             isFavourite: true)))
                    }
                }

                context("and favourite cities scope is selected") {

                    beforeEach {
                        presenter.presentCities(allCities: Mock.allCities,
                                                favourites: Mock.favouriteCities,
                                                filteringPhrase: "a",
                                                favouriteState: true)
                    }

                    it("should call controller to display cities") {
                        expect(controller.displayCitiesCalled).to(beTrue())
                    }

                    it("should display only favourite cities containing user search") {
                        expect(controller.displayCitiesFavouriteCitiesDisplayable?.count).to(equal(2))
                    }

                    it("should display city containing user search text") {
                        expect(controller.displayCitiesFavouriteCitiesDisplayable).to(contain(FavouriteCitiesListDisplayable(city: Mock.city1,
                                                                                                                             isFavourite: true)))
                    }
                }
            }
        }
    }
}
