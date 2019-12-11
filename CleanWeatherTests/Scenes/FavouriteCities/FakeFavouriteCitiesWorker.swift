//
//  FakeFavouriteCitiesWorker.swift
//  CleanWeatherTests
//
//  Created by Marek Skrzelowski on 10/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

@testable import CleanWeather

final class FakeFavouriteCitiesWorker: FavouriteCitiesWorker {

    var fetchAllCitiesCalled: Bool?
    var fetchAllCitiesCompletion: FetchCitiesCompletion?
    var fetchFavouriteCitiesCalled: Bool?
    var fetchFavouriteCitiesCompletion: FetchFavouriteCitiesCompletion?
    var saveFavouriteCitiesCalled: Bool?
    var saveFavouriteFavouriteCitiesCalled: [City]?
    var saveFavourtieCompletion: SaveFavouriteCitiesCompletion?

    func fetchAllCities(completion: FetchCitiesCompletion?) {
        fetchAllCitiesCalled = true
        fetchAllCitiesCompletion = completion
    }

    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?) {
        fetchFavouriteCitiesCalled = true
        fetchFavouriteCitiesCompletion = completion
    }

    func saveFavourite(favouriteCities: [City], completion: SaveFavouriteCitiesCompletion?) {
        saveFavouriteCitiesCalled = true
        saveFavouriteFavouriteCitiesCalled = favouriteCities
        saveFavourtieCompletion = completion
    }
}
