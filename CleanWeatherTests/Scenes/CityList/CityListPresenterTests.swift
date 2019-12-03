//
//  CityListPresenterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityListPresenterTests: QuickSpec {

    override func spec() {

        var presenter: CityListPresenterImpl<FakeCityListController>!
        var controller: FakeCityListController!

        beforeEach {
            presenter = CityListPresenterImpl<FakeCityListController>()
            controller = FakeCityListController()
            presenter.controller = controller
        }

        describe("displaying cities") {

            beforeEach {
                presenter.presentCitiesWeather(citiesWeather: Mock.citiesWeather)
            }

            it("should call controller to display cities") {
                expect(controller.displayCityCalled).notTo(beNil())
                expect(controller.displayCityCalled?.count).to(equal(Mock.citiesWeather.count))
            }

            it("should display rounded temperature with degree sign") {
                expect(controller.displayCityCalled?[0].temp).to(equal("23°"))
            }
        }
    }
}
