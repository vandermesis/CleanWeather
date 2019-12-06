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
    func toogleFavourite(for city: City)
    func fetchFavouriteCities() -> [City]?
}

final class FavouriteCitiesWorkerImpl {

    private let networking: WeatherNetworking
    private let database: FavouriteCityRepository

    init(networking: WeatherNetworking, database: FavouriteCityRepository) {
        self.networking = networking
        self.database = database
    }
}

extension FavouriteCitiesWorkerImpl: FavouriteCitiesWorker {

    func fetchAllCities(completion: FetchCitiesCompletion?) {
        networking.fetchCities(completion: completion)
    }

    func toogleFavourite(for city: City) {
        guard let favouriteCities = database.getFavouriteCities() else { return }
        if favouriteCities.contains(where: { $0.id == city.id }) {
            database.removeFavouriteCity(city: city)
        } else {
            database.addFavouriteCity(city: city)
        }
    }

    func fetchFavouriteCities() -> [City]? {
        return database.getFavouriteCities()
    }
}
