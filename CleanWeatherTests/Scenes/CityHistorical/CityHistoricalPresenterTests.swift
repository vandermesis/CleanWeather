//
//  CityHistoricalPresenterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 02/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityHistoricalPresenterTests: QuickSpec {

    override func spec() {

        var controller: FakeCityHistoricalController!
        var presenter: CityHistoricalPresenterImpl<FakeCityHistoricalController>!

        beforeEach {
            controller = FakeCityHistoricalController()
            presenter = CityHistoricalPresenterImpl<FakeCityHistoricalController>()
            presenter.controller = controller
        }

        describe("presenting city details") {

            beforeEach {
                presenter.presentCityDetails(Mock.cityWeather3)
            }

            it("should call controller to display city details") {
                expect(controller.displayCityDetailsCalled).notTo(beNil())
                expect(controller.displayCityDetailsCalled?.name).to(equal(Mock.cityWeather3.city))
            }

            it("should display rounded temperature with degree sign") {
                expect(controller.displayCityDetailsCalled?.temp).to(equal("-10°"))
            }
        }

        describe("presenting city historical weather") {

            beforeEach {
                presenter.presentCityHistoricalWeather(Mock.cityHistorical3)
            }

            it("should call controller to display city historical weather") {
                expect(controller.displayCityHistoricalCalled).notTo(beNil())
                expect(controller.displayCityHistoricalCalled?.name).to(equal(Mock.cityHistorical3.city))
            }

            it("should display rounded temperature with degree sign") {
                expect(controller.displayCityHistoricalCalled?.temp).to(equal("-10°"))
            }
        }

        describe("presenting formatted date") {

            beforeEach {
                let date = Date()
                presenter.presentFormatedDate(date)
            }

            it("should display date formatted to String") {
                expect(controller.displayFormattedDateDateCalled).to(beAKindOf(String.self))
            }
        }
    }
}
