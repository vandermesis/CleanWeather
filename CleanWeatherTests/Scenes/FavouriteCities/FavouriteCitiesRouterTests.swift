//
//  FavouriteCitiesRouterTests.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Quick
import Nimble

@testable import CleanWeather

final class FavouriteCitiesRouterTests: QuickSpec {

    override func spec() {

        var router: FavouriteCitiesRouterImpl!
        var favouriteCitiesController: UIViewController!
        var cityListController: UIViewController!
        var navigationController: UINavigationController!

        beforeEach {
            router = FavouriteCitiesRouterImpl()
            favouriteCitiesController = FavouriteCitiesCreator().getController()
            cityListController = CityListCreator().getController()
            navigationController = UINavigationController()
            navigationController.viewControllers = [favouriteCitiesController, cityListController]
            router.controller = favouriteCitiesController
        }

        describe("navigating back to city list") {

            beforeEach {
                router.navigateBackToCityList()
            }

            it("should call controller to pop to CityListController") {
                expect(navigationController.topViewController).toEventually(beAKindOf(CityListController.self))
            }
        }
    }
}
