//
//  FavouriteCitiesInteractorTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class FavouriteCitiesInteractorTests: QuickSpec {

    override func spec() {

        var presenter: FakeFavouriteCitiesPresenter!
        var worker: FakeFavouriteCitiesWorker!
        var router: FakeFavouriteCitiesRouter!
        var interactor: FavouriteCitiesInteractorImpl!

        beforeEach {
            presenter = FakeFavouriteCitiesPresenter()
            worker = FakeFavouriteCitiesWorker()
            router = FakeFavouriteCitiesRouter()
            interactor = FavouriteCitiesInteractorImpl(presenter: presenter, worker: worker, router: router)
        }

        describe("geting cities") {

            beforeEach {
                interactor.getCities()
            }

            it("should call presenter to show spinner") {
                expect(presenter.toggleSpinnerStateCalled).to(beTrue())
            }

            it("should call worker to fetch all cities") {
                expect(worker.fetchAllCitiesCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    worker.fetchAllCitiesCompletion?(.success(Mock.allCities))
                    worker.fetchFavouriteCitiesCompletion?(.success(Mock.favouriteCities))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }

                it("should call presenter to present all cities") {
                    expect(presenter.presentCitiesAllCitiesCalled).notTo(beNil())
                    expect(presenter.presentCitiesAllCitiesCalled?.count).to(equal(Mock.allCities.count))
                }

                it("should call presenter to present favourite cities") {
                    expect(presenter.presentCitiesFavouritesCalled).notTo(beNil())
                    expect(presenter.presentCitiesFavouritesCalled?.count).to(equal(Mock.favouriteCities.count))
                }

                it("should not call presenter to present any alert") {
                    expect(presenter.presentAlertTitleCalled).to(beNil())
                    expect(presenter.presentAlertMessageCalled).to(beNil())
                    expect(presenter.presentErrorCalled).to(beNil())
                }
            }

            context("on failure response") {

                beforeEach {
                    worker.fetchAllCitiesCompletion?(.failure(UnitTestError()))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }

                it("should call presenter to display error") {
                    expect(presenter.presentErrorCalled).to(beAKindOf(UnitTestError.self))
                }
            }
        }

        describe("selecting city") {

            beforeEach {
                interactor.getCities()
                worker.fetchAllCitiesCompletion?(.success(Mock.allCities))
                worker.fetchFavouriteCitiesCompletion?(.success(Mock.favouriteCities))
            }

            context("on valid id tapped") {

                context("if tapped city is favourite") {

                    beforeEach {
                        interactor.didSelectCity(id: Mock.city1.id)
                    }

                    it("should call presenter to present all cities") {
                        expect(presenter.presentCitiesAllCitiesCalled?.count).to(equal(Mock.allCities.count))
                    }

                    it("should call presenter to present favourite cities without tapped city") {
                        expect(presenter.presentCitiesFavouritesCalled?.count).to(equal(3))
                        expect(presenter.presentCitiesFavouritesCalled).notTo(contain(Mock.city1))
                    }
                }

                context("if tapped city is not favourtie") {

                    beforeEach {
                        interactor.didSelectCity(id: Mock.city8.id)
                    }

                    it("should call presenter to present all cities") {
                        expect(presenter.presentCitiesAllCitiesCalled?.count).to(equal(Mock.allCities.count))
                    }

                    it("should call presenter to present favourite cities with tapped city") {
                        expect(presenter.presentCitiesFavouritesCalled?.count).to(equal(5))
                        expect(presenter.presentCitiesFavouritesCalled).to(contain(Mock.city8))
                    }

                }
            }

            context("on invalid id tapped") {

                beforeEach {
                    interactor.didSelectCity(id: "invalid-ID")
                }

                it("should call presenter to present all cities") {
                    expect(presenter.presentCitiesAllCitiesCalled?.count).to(equal(Mock.allCities.count))
                }

                it("should call presenter to present favourite cities without any change") {
                    expect(presenter.presentCitiesFavouritesCalled?.count).to(equal(Mock.favouriteCities.count))
                }
            }
        }

        describe("pressing save button") {

            beforeEach {
                interactor.getCities()
                worker.fetchAllCitiesCompletion?(.success(Mock.allCities))
                worker.fetchFavouriteCitiesCompletion?(.success(Mock.favouriteCities))
                interactor.didPressSaveButton()
            }

            it("should call presenter to show spinner") {
                expect(presenter.toggleSpinnerStateCalled).to(beTrue())
            }

            it("should call worker to save favourite cities") {
                expect(worker.saveFavouriteCitiesCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    worker.saveFavourtieCompletion?(.success(Empty()))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }
            }

            context("on failure response") {

                beforeEach {
                    worker.saveFavourtieCompletion?(.failure(UnitTestError()))
                }

                it("should call presenter to present error") {
                    expect(presenter.presentErrorCalled).to(beAKindOf(UnitTestError.self))
                }
            }
        }
    }
}
