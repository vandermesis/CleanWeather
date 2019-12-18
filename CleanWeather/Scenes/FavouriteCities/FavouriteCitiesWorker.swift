//
//  FavouriteCitiesWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchCitiesCompletion = (Result<[City], Error>) -> Void

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
        networking.fetchCities { result in
            switch result {
            case .success(let apiResponse):
                let allCities = apiResponse.records.map { City(id: $0.recordid,
                                                               name: $0.fields.accentcity,
                                                               latitude: $0.fields.latitude,
                                                               longitude: $0.fields.longitude)}
                completion?(.success(allCities))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }

    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?) {
        repository.fetchFavouriteCities(completion: completion)
    }

    func saveFavourite(favouriteCities: [City], completion: SaveFavouriteCitiesCompletion?) {
        repository.saveFavourite(favouriteCities: favouriteCities, completion: completion)
    }
}
