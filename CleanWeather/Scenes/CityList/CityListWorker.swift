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

        var counter = 0
        var citiesWeather = [CityWeather]()

        cities.forEach { city in
            let coordinates = Coordinates(lat: city.latitude, lon: city.longitude)
            networking.fetchCurrentWeatherForCity(coordinates: coordinates.stringValue) { result in
                switch result {
                case .success(let apiResponse):
                    guard let cityTemp = apiResponse.currently.temperature else {
                        completion?(.failure(MissingAPIData()))
                        return
                    }
                    let cityWeather = CityWeather(id: city.id,
                                                  city: city.name,
                                                  latitude: city.latitude,
                                                  longitude: city.longitude,
                                                  temperature: cityTemp,
                                                  icon: apiResponse.currently.icon ?? "")
                    citiesWeather.append(cityWeather)
                    counter += 1
                    if counter == cities.count {
                        let sortedCities = self.sortCity(city: citiesWeather)
                        completion?(.success(sortedCities))
                    }
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        }
    }
}

private extension CityListWorkerImpl {
    
    private func sortCity(city: [CityWeather]) -> [CityWeather] {
        return city.sorted(by: { $0.city < $1.city })
    }
}
