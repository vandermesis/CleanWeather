//
//  FakeFavouriteCitiesController.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

@testable import CleanWeather

final class FakeFavouriteCitiesController: UIViewController, FavouriteCitiesPresentable {

    var displayCitiesCalled: Bool?
    var displayCitiesFavouriteCitiesDisplayable: [FavouriteCitiesListDisplayable]?

    func displayCities(_ city: [FavouriteCitiesListDisplayable]) {
        displayCitiesCalled = true
        displayCitiesFavouriteCitiesDisplayable = city
    }
}
