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
        }

        describe("displaying cities") {

            beforeEach {
                presenter.displayCitiesWeather(citiesWeather: Mock.citiesWeather)
            }

            it("should call controller to display cities") {
                expect(controller.displayCityCalled).notTo(beNil())
                expect(controller.displayCityCalled?.count).to(equal(Mock.citiesWeather.count))
            }
        }
    }
}
