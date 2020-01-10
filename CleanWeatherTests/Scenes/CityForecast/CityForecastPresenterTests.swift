//
//  CityForecastPresenterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityForecastPresenterTests: QuickSpec {

    override func spec() {

        var controller: FakeCityForecastController!
        var presenter: CityForecastPresenterImpl<FakeCityForecastController>!

        beforeEach {
            controller = FakeCityForecastController()
            presenter = CityForecastPresenterImpl<FakeCityForecastController>()
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

        describe("presenting city forecast list") {

            beforeEach {
                let cityForecast = CityForecast(hourly: Mock.cityHourlyForecast, daily: Mock.cityDailyForecast)
                presenter.presentCityForecastList(cityForecast)
            }

            it("should call controller to display city hourly forecast") {
                expect(controller.displayCityForecastHourlyForecastCalled).notTo(beNil())
                expect(controller.displayCityForecastHourlyForecastCalled?.count).to(equal(Mock.cityHourlyForecast.count))
            }

            it("should call controller to display city daily forecast") {
                expect(controller.displayCityForecastDailyForecastCalled).notTo(beNil())
                expect(controller.displayCityForecastDailyForecastCalled?.count).to(equal(Mock.cityDailyForecast.count))
            }

            it("should display rounded temperature with degree sign") {
                expect(controller.displayCityForecastHourlyForecastCalled?[0].temp).to(equal("10°"))
                expect(controller.displayCityForecastDailyForecastCalled?[0].maxTemp).to(equal("10°"))
                expect(controller.displayCityForecastDailyForecastCalled?[0].minTemp).to(equal("5°"))

            }

            it("should display percentage of precip with percent sign") {
                expect(controller.displayCityForecastHourlyForecastCalled?[0].precip).to(equal("46%"))
                expect(controller.displayCityForecastDailyForecastCalled?[0].precip).to(equal("30%"))
            }
        }
    }
}
