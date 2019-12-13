//
//  FavouriteCitiesWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol FavouriteCitiesWorker {
    func fetchAllCities(completion: FetchCitiesCompletion?)
    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?)
    func saveFavourite(favouriteCities: [City], completion: SaveFavouriteCitiesCompletion?)
}

final class FavouriteCitiesWorkerImpl {

    private let networking: WeatherNetworking
    private let repository: FavouriteCityRepository

    init(networking: WeatherNetworking, database: FavouriteCityRepository) {
        self.networking = networking
        self.repository = database
    }
}

extension FavouriteCitiesWorkerImpl: FavouriteCitiesWorker {

    func fetchAllCities(completion: FetchCitiesCompletion?) {
        networking.fetchCities(completion: completion)
    }

    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?) {
        repository.fetchFavouriteCities(completion: completion)
    }

    func saveFavourite(favouriteCities: [City], completion: SaveFavouriteCitiesCompletion?) {
        repository.saveFavourite(favouriteCities: favouriteCities, completion: completion)
    }
}
