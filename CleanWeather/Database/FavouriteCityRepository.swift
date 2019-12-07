//
//  FavouriteCityRepository.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol FavouriteCityRepository {
    func getFavouriteCities() -> [City]
    func addFavouriteCity(city: City)
    func removeFavouriteCity(city: City)
}

final class FavouriteCityRepositoryImpl {

    private let defaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.defaults = userDefaults
    }
}

extension FavouriteCityRepositoryImpl: FavouriteCityRepository {

    func getFavouriteCities() -> [City] {
        guard let savedCities = defaults.object(forKey: "FavouriteCities") as? Data else { return [City]() }
        let decoder = JSONDecoder()
        guard let favouriteCities = try? decoder.decode([City].self, from: savedCities) else { return [City]() }
        return favouriteCities
    }

    func addFavouriteCity(city: City) {
        var favourites = getFavouriteCities()
        if favourites.isEmpty {
            saveFavouriteCities(cities: [City]())
        } else {
            favourites.append(city)
            saveFavouriteCities(cities: favourites)
        }
    }

    func removeFavouriteCity(city: City) {
        let favourites = getFavouriteCities()
        let filtered = favourites.filter { $0.name != city.name }
        saveFavouriteCities(cities: filtered)
    }
}

private extension FavouriteCityRepositoryImpl {

    private func saveFavouriteCities(cities: [City]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cities) {
            defaults.set(encoded, forKey: "FavouriteCities")
        }
    }
}
