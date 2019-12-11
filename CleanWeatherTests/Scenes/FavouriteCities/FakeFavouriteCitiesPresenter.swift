//
//  FakeFavouriteCitiesPresenter.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

@testable import CleanWeather

final class FakeFavouriteCitiesPresenter: FakePresenter, FavouriteCitiesPresenter {

    var presentCitiesCalled: Bool?
    var presentCitiesAllCities: [City]?
    var presentCitiesFavourites: [City]?

    func presentCities(allCities: [City], favourites: [City]) {
        presentCitiesCalled = true
        presentCitiesAllCities = allCities
        presentCitiesFavourites = favourites
    }
}
