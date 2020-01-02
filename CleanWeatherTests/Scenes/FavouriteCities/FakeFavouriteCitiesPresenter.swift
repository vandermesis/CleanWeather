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
    var presentCitiesFavouriteCitiesCalled: CitiesFilter?

    func presentCities(favouriteCities: CitiesFilter) {
        presentCitiesCalled = true
        presentCitiesFavouriteCitiesCalled = favouriteCities
    }
}
