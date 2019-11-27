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

        var router: FakeCityListRouter!
        var worker: FakeCityListWorker!
        var presenter: FakeCityListPresenter!
        var interactor: CityListInteractorImpl!

        beforeEach {
            router = FakeCityListRouter()
            worker = FakeCityListWorker()
            presenter = FakeCityListPresenter()
            interactor = CityListInteractorImpl(presenter: presenter, worker: worker, router: router)
        }

        describe("getting City") {

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
                    expect(presenter.displayCitiesWeatherCalled).notTo(beNil())
                    expect(presenter.displayCitiesWeatherCalled?.count).to(equal(Mock.citiesWeather.count))
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
                    expect(router.navigateToCityDetailsCityWeatherCalled?.city).to(equal(Mock.cityWeather4.city))
                }
            }

            context("on invalid id tapped") {

                beforeEach {
                    interactor.didSelectCityCell(id: "invalidID")
                }

                it("should not call router to navigate to city details") {
                    expect(router.navigateToCityDetailsCityWeatherCalled).to(beNil())
                }
            }
        }
    }
}
