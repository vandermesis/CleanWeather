//
//  FavouriteCitiesWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol FavouriteCitiesWorker {
    func fetchCity(completion: FetchCitiesCompletion?)
    func saveFavouriteCity(city: FavouriteCity)
    func loadFavouriteCities() -> [FavouriteCity]
}

final class FavouriteCitiesWorkerImpl {

    private let networking: WeatherNetworking
    private let database: CityDatabase

    init(networking: WeatherNetworking, database: CityDatabase) {
        self.networking = networking
        self.database = database
    }
}

extension FavouriteCitiesWorkerImpl: FavouriteCitiesWorker {

    func fetchCity(completion: FetchCitiesCompletion?) {
        networking.fetchCities(completion: completion)
    }

    func saveFavouriteCity(city: FavouriteCity) {
        database.saveFavouriteCity(city: city)
    }

    func loadFavouriteCities() -> [FavouriteCity] {
        return database.loadFavouriteCities()
    }
}
