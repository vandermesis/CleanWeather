//
//  CityListRouterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityListRouterTests: QuickSpec {

    override func spec() {

        var router: CityListRouterImpl!
        var controller: UIViewController!
        var navigationController: UINavigationController!

        beforeEach {
            router = CityListRouterImpl()
            controller = CityListCreator().getController()
            navigationController = UINavigationController()
            navigationController.viewControllers = [controller]
            router.controller = controller
        }

        describe("navigate to city details") {

            beforeEach {
                router.navigateToCityForecast(cityWeather: Mock.cityWeather1)
            }

            it("should move to expected controller") {
                expect(navigationController.topViewController).toEventually(beAKindOf(CityForecastController.self))
            }
        }
    }
}
