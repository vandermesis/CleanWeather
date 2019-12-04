//
//  CityHistoricalInteractorTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityHistoricalInteractorTests: QuickSpec {

    override func spec() {

        let date = Date(timeIntervalSince1970: 1358081652.0)

        var presenter: FakeCityHistoricalPresenter!
        var worker: FakeCityHistoricalWorker!
        var router: FakeCityHistoricalRouter!
        var interactor: CityHistoricalInteractorImpl!

        beforeEach {
            presenter = FakeCityHistoricalPresenter()
            worker = FakeCityHistoricalWorker()
            router = FakeCityHistoricalRouter()
            interactor = CityHistoricalInteractorImpl(cityDetails: Mock.cityWeather1,
                                                      presenter: presenter,
                                                      worker: worker,
                                                      router: router)
        }

        describe("getting city details") {

            beforeEach {
                interactor.getCityDetails()
            }

            it("should call presenter to display city details") {
                expect(presenter.presentCityDetailsCalled?.city).to(equal(Mock.cityWeather1.city))
            }
        }

        describe("getting city historical weather") {

            beforeEach {
                interactor.getCityHistoricalWeather(date: date)
            }

            it("should call presenter to show spinner") {
                expect(presenter.toggleSpinnerStateCalled).to(beTrue())
            }

            it("should call worker to fetch historical weather") {
                //TODO: Change to Mock.cityWeather1.id after proper setup of DB and removing networking mock
                expect(worker.fetchCityHistoricalWeatherIdCalled).to(equal(Mock.cityWeather1.city))
                expect(worker.fetchCityHistoricalWeatherDateCalled).to(beAKindOf(Date.self))
            }

            context("on success response") {

                beforeEach {
                    worker.fetchCityHistoricalWeatherCompletion?(.success(Mock.cityHistorical1))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }

                it("should call presenter to display city historical weather") {
                    expect(presenter.presentCityHistoricalWeatherCalled).notTo(beNil())
                    expect(presenter.presentCityHistoricalWeatherCalled?.city).to(equal("Katowice"))
                }

                it("should not call presenter to display any alert") {
                    expect(presenter.presentAlertTitleCalled).to(beNil())
                    expect(presenter.presentAlertMessageCalled).to(beNil())
                    expect(presenter.presentErrorCalled).to(beNil())
                }
            }

            context("on failure response") {

                beforeEach {
                    worker.fetchCityHistoricalWeatherCompletion?(.failure(UnitTestError()))
                }

                it("should call presenter to hide spinner") {
                    expect(presenter.toggleSpinnerStateCalled).to(beFalse())
                }

                it("should call presenter to display error") {
                    expect(presenter.presentErrorCalled).to(beAKindOf(UnitTestError.self))
                }
            }
        }

        describe("selecting date") {

            beforeEach {
                interactor.didSelectDate(date: date)
            }

            it("should call presenter to format date to string") {
                expect(presenter.presentFormatedDateCalled).to(beAKindOf(Date.self))
            }
        }
    }
}
