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
    func getFavouriteCities() -> [City]
    func addFavouriteCity(city: City)
    func removeFavouriteCity(city: City)
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

    func getFavouriteCities() -> [City] {
        guard let savedCities = defaults.object(forKey: .favouriteCityRepositoryKey) as? Data else { return [City]() }
        guard let favouriteCities = try? jsonHelper.decoder.decode([City].self, from: savedCities) else { return [City]() }
        return favouriteCities
    }

    func addFavouriteCity(city: City) {
        var favourites = getFavouriteCities()
        if !favourites.contains(city) {
            favourites.append(city)
            saveFavouriteCities(cities: favourites)
        }
    }

    func removeFavouriteCity(city: City) {
        let favourites = getFavouriteCities()
        let filtered = favourites.filter { $0.id != city.id }
        saveFavouriteCities(cities: filtered)
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
