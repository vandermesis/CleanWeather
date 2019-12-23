//
//  CityListWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchWeatherCompletion = (Result<[CityWeather], Error>) -> Void

protocol CityListWorker {
    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?)
    func fetchCitiesWeather(cities: [City], completion: FetchWeatherCompletion?)
}

final class CityListWorkerImpl {

    private let networking: WeatherNetworking
    private let repository: FavouriteCityRepository

    init(networking: WeatherNetworking, repository: FavouriteCityRepository) {
        self.networking = networking
        self.repository = repository
    }
}

extension CityListWorkerImpl: CityListWorker {

    func fetchFavouriteCities(completion: FetchFavouriteCitiesCompletion?) {
        repository.fetchFavouriteCities(completion: completion)
    }

    func fetchCitiesWeather(cities: [City], completion: FetchWeatherCompletion?) {

        //TODO: Replace with proper logic for all cities
        let coordinates = Coordinates(lat: 50, lon: 10)
        
        networking.fetchCurrentWeatherForCity(coordinates: coordinates.stringValue) { [weak self] result in

            switch result {
            case .success(let apiResponse):
                print(apiResponse)
            case .failure(let error):
                completion?(.failure(error))
            }
            
//            guard let self = self, case .success(let city) = result else {
//                completion?(result)
//                return
//            }
            
//            let sortedCity = self.sortCity(city: city)
//            completion?(.success(sortedCity))
        }
    }
}

private extension CityListWorkerImpl {
    
    private func sortCity(city: [CityWeather]) -> [CityWeather] {
        return city.sorted(by: { $0.city < $1.city })
    }
}
