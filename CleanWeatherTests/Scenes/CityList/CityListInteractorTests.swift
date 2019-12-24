//
//  CityListInteractorTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityListInteractorTests: QuickSpec {

    override func spec() {

        var presenter: FakeCityListPresenter!
        var worker: FakeCityListWorker!
        var router: FakeCityListRouter!
        var interactor: CityListInteractorImpl!

        beforeEach {
            presenter = FakeCityListPresenter()
            worker = FakeCityListWorker()
            router = FakeCityListRouter()
            interactor = CityListInteractorImpl(presenter: presenter, worker: worker, router: router)
        }

        describe("getting favourite cities") {

            beforeEach {
                interactor.getFavouriteCities()
            }

            it("should call worker to get cities") {
                expect(worker.fetchCityFavouriteCitiesCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    worker.fetchCityFavouriteCitiesCompletion?(.success(Mock.favouriteCities))
                }

                it("presenter should not present cities") {
                    expect(presenter.presentCitiesWeatherCalled).to(beNil())
                }

                it("should not call presenter to display any alert") {
                    expect(presenter.presentAlertMessageCalled).to(beNil())
                    expect(presenter.presentAlertTitleCalled).to(beNil())
                    expect(presenter.presentErrorCalled).to(beNil())
                }

                context("on success getCitiesWeather response") {

                    beforeEach {
                        worker.fetchCitiesWeatherCompletion?(.success(Mock.citiesWeather))
                    }

                    it("should call worker to get cities") {
                        expect(worker.fetchCitiesWeatherCalled).to(beTrue())
                    }

                    it("should call presenter to display valid cities") {
                        expect(presenter.presentCitiesWeatherCalled).notTo(beNil())
                        expect(presenter.presentCitiesWeatherCalled?.count).to(equal(Mock.citiesWeather.count))
                    }

                    it("should not call presenter to display any alert") {
                        expect(presenter.presentAlertMessageCalled).to(beNil())
                        expect(presenter.presentAlertTitleCalled).to(beNil())
                        expect(presenter.presentErrorCalled).to(beNil())
                    }
                }

                context("on failure getCitiesWeather response") {

                    beforeEach {
                        worker.fetchCitiesWeatherCompletion?(.failure(UnitTestError()))
                    }

                    it("should call presenter to hide spinner") {
                        expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                    }

                    it("should call presenter to display error") {
                        expect(presenter.presentErrorCalled).to(beAKindOf(UnitTestError.self))
                    }
                }
            }

            context("on failure response") {

                beforeEach {
                    worker.fetchCityFavouriteCitiesCompletion?(.failure(UnitTestError()))
                }

                it("should call presenter to display error") {
                    expect(presenter.presentErrorCalled).to(beAKindOf(UnitTestError.self))
                }
            }
        }

        describe("selecting city cell") {

            beforeEach {
                interactor.getFavouriteCities()
                worker.fetchCityFavouriteCitiesCompletion?(.success(Mock.favouriteCities))
                worker.fetchCitiesWeatherCompletion?(.success(Mock.citiesWeather))
            }

            context("on valid id tapped") {

                beforeEach {
                    interactor.didSelectCityCell(id: Mock.favouriteCity2.id)
                    print("HERE->", router.navigateToCityForecastCityWeatherCalled)
                }

//                FIXME: Why I can't get New York here?
//                it("should call router to navigate to city details") {
//                    expect(router.navigateToCityForecastCityWeatherCalled?.city).to(equal("New York"))
//                }
            }

            context("on invalid id tapped") {

                beforeEach {
                    interactor.didSelectCityCell(id: "invalidID")
                }

                it("should not call router to navigate to city details") {
                    expect(router.navigateToCityForecastCityWeatherCalled).to(beNil())
                }
            }
        }

        describe("pressing add button") {

            beforeEach {
                interactor.didPressAddButton()
            }

            it("should call router to navigate to favourite cities") {
                expect(router.navigateToFavouriteCitiesCalled).to(beTrue())
            }
        }
    }
}
