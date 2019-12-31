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
    var presentCitiesAllCitiesCalled: [City]?
    var presentCitiesFavouritesCalled: [City]?
    var presentCitiesCityNameCalled: String?
    var presentCitiesFilteringStateCalled: Bool?
    var presentCitiesFavouriteStateCalled: Bool?

    func presentCities(allCities: [City], favourites: [City], cityName: String, filteringState: Bool, favouriteState: Bool) {
        presentCitiesCalled = true
        presentCitiesAllCitiesCalled = allCities
        presentCitiesFavouritesCalled = favourites
        presentCitiesCityNameCalled = cityName
        presentCitiesFilteringStateCalled = filteringState
        presentCitiesFavouriteStateCalled = favouriteState
    }
}
