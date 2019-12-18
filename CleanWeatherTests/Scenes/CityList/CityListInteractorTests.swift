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

            it("should call presenter to show spinner") {
                expect(presenter.toggleSpinnerStateCalled).to(beTrue())
            }

            it("should call worker to get cities") {
                expect(worker.fetchCityFavouriteCitiesCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    worker.fetchCityFavouriteCitiesCompletion?(.success(Mock.favouriteCities))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }

                it("should call presenter to display valid cities") {
                    expect(presenter.presentCitiesWeatherCalled).notTo(beNil())
                    expect(presenter.presentCitiesWeatherCalled?.count).to(equal(Mock.favouriteCities.count))
                }

                it("should not call presenter to display any alert") {
                    expect(presenter.presentAlertMessageCalled).to(beNil())
                    expect(presenter.presentAlertTitleCalled).to(beNil())
                    expect(presenter.presentErrorCalled).to(beNil())
                }
            }

            context("on failure response") {

                beforeEach {
                    worker.fetchCityFavouriteCitiesCompletion?(.failure(UnitTestError()))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }

                it("should call presenter to display error") {
                    expect(presenter.presentErrorCalled).to(beAKindOf(UnitTestError.self))
                }
            }
        }

        describe("getting cities") {

            beforeEach {
                interactor.getCitiesWeather()
            }

            it("should call presenter to show spinner") {
                expect(presenter.toggleSpinnerStateCalled).to(beTrue())
            }

            it("should call worker to get cities") {
                expect(worker.fetchCityWeatherCalled).to(beTrue())
            }

            context("on success response") {

                beforeEach {
                    worker.fetchCityWeatherCompletion?(.success(Mock.citiesWeather))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
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

            context("on failure response") {

                beforeEach {
                    worker.fetchCityWeatherCompletion?(.failure(UnitTestError()))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }

                it("should call presenter to display error") {
                    expect(presenter.presentErrorCalled).to(beAKindOf(UnitTestError.self))
                }
            }
        }

        describe("selecting city cell") {

            beforeEach {
                interactor.getCitiesWeather()
                worker.fetchCityWeatherCompletion?(.success(Mock.citiesWeather))
            }

            context("on valid id tapped") {

                beforeEach {
                    interactor.didSelectCityCell(id: Mock.cityWeather4.id)
                }

                it("should call router to navigate to city details") {
                    expect(router.navigateToCityForecastCityWeatherCalled?.city).to(equal(Mock.cityWeather4.city))
                }
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
