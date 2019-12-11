//
//  FakeFavouriteCityRepository.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 11/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

@testable import CleanWeather

final class FakeFavouriteCityRepository: FavouriteCityRepository {

    var fetchFavouriteCitiesCalled: Bool?
    var fetchFavouriteCitiesCompletion: FetchFavouriteCitiesCompletion?
    var saveFavouriteCalled: Bool?
    var saveFavouriteFavouriteCities: [City]?
    var saveFavouriteCompletion: SaveFavouriteCitiesCompletion?

    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?) {
        fetchFavouriteCitiesCalled = true
        fetchFavouriteCitiesCompletion = completion
    }

    func saveFavourite(favouriteCities: [City], completion: SaveFavouriteCitiesCompletion?) {
        saveFavouriteCalled = true
        saveFavouriteFavouriteCities = favouriteCities
        saveFavouriteCompletion = completion
    }
}
