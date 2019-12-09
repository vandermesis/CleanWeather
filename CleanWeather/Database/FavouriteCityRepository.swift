//
//  FavouriteCityRepository.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchFavouriteCitiesCompletion = (Result<[City], Error>) -> Void

protocol FavouriteCityRepository {
    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?)
    func addFavouriteCity(city: City, completion: FetchFavouriteCitiesCompletion?)
    func removeFavouriteCity(city: City, completion: FetchFavouriteCitiesCompletion?)
}

final class FavouriteCityRepositoryImpl {

    private let defaults: UserDefaults
    private let jsonHelper: JSONHelper

    init(userDefaults: UserDefaults, jsonHelper: JSONHelper) {
        self.defaults = userDefaults
        self.jsonHelper = jsonHelper
    }
}

extension FavouriteCityRepositoryImpl: FavouriteCityRepository {

    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?) {
        guard let savedCities = defaults.object(forKey: .favouriteCityRepositoryKey) as? Data else { return }
        guard let favouriteCities = try? jsonHelper.decoder.decode([City].self, from: savedCities) else { return }
        completion?(Result.success(favouriteCities))
    }

    func addFavouriteCity(city: City, completion: FetchFavouriteCitiesCompletion?) {
        fetchFavouriteCities { result in
            switch result {
            case .success(var favourites):
                if !favourites.contains(city) {
                    favourites.append(city)
                    self.saveFavouriteCities(cities: favourites)
                    completion?(Result.success(favourites))
                }
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }

    func removeFavouriteCity(city: City, completion: FetchFavouriteCitiesCompletion?) {
        fetchFavouriteCities { result in
            switch result {
            case .success(let favourites):
                let filtered = favourites.filter { $0.id != city.id }
                self.saveFavouriteCities(cities: filtered)
                completion?(Result.success(filtered))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }
}

private extension FavouriteCityRepositoryImpl {

    private func saveFavouriteCities(cities: [City]) {
        guard let encoded = try? jsonHelper.encoder.encode(cities) else { return }
        defaults.set(encoded, forKey: .favouriteCityRepositoryKey)
    }
}

private extension String {
    static let favouriteCityRepositoryKey = "FavouriteCities"
}
