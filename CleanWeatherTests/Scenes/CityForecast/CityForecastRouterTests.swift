//
//  CityForecastRouterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 22/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class CityForecastRouterTests: QuickSpec {

    override func spec() {

        var router: CityForecastRouterImpl!
        var controller: UIViewController!
        var navigationController: UINavigationController!

        beforeEach {
            router = CityForecastRouterImpl()
            controller = CityForecastCreator().getController(with: Mock.cityWeather2)
            navigationController = UINavigationController()
            navigationController.viewControllers = [controller]
            router.controller = controller
        }

        describe("navigate to city historical") {

            beforeEach {
                router.navigateToCityHistorical(cityWeather: Mock.cityWeather2)
            }

            it("should move to expected controller") {
                expect(navigationController.topViewController).toEventually(beAKindOf(CityHistoricalController.self))
            }
        }
    }
}
