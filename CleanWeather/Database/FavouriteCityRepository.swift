//
//  FavouriteCityRepository.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchFavouriteCitiesCompletion = (Result<[City], Error>) -> Void
typealias SaveFavouriteCitiesCompletion = (Result<NoResponse, Error>) -> Void

protocol FavouriteCityRepository {
    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?)
    func saveFavourite(favouriteCities: [City], completion: SaveFavouriteCitiesCompletion?)
}

final class FavouriteCityRepositoryImpl {

    private let defaults: UserDefaults
    private let jsonHelper: SerializerHelper

    init(userDefaults: UserDefaults, jsonHelper: SerializerHelper) {
        self.defaults = userDefaults
        self.jsonHelper = jsonHelper
    }
}

extension FavouriteCityRepositoryImpl: FavouriteCityRepository {

    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?) {
        guard let savedCities = self.defaults.object(forKey: .favouriteCityRepositoryKey) as? Data else {
            completion?(Result.failure(UserDefaultsError.readUserDefaults))
            return
        }
        guard let favouriteCities = try? self.jsonHelper.decoder.decode([City].self, from: savedCities) else {
            completion?(Result.failure(SerializerError.jsonDecodingError))
            return
        }
        DispatchQueue.main.async {
            completion?(Result.success(favouriteCities))
        }
    }

    func saveFavourite(favouriteCities: [City], completion: SaveFavouriteCitiesCompletion?) {
        guard let encoded = try? self.jsonHelper.encoder.encode(favouriteCities) else {
            completion?(Result.failure(SerializerError.jsonEncodingError))
            return
        }
        self.defaults.set(encoded, forKey: .favouriteCityRepositoryKey)
        DispatchQueue.main.async {
            completion?(Result.success(NoResponse()))
        }
    }
}

private extension String {
    static let favouriteCityRepositoryKey = "FavouriteCities"
    static let applicationLabel = "com.vandermesis.CleanWeather.queue"
}
