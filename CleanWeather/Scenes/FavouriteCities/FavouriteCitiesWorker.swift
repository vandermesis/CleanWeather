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
    func setFavouriteState(for city: City, newState: Bool)
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

    func setFavouriteState(for city: City, newState: Bool) {
        if newState {
            repository.removeFavouriteCity(city: city, completion: nil)
        } else {
            repository.addFavouriteCity(city: city, completion: nil)
        }
    }
}
