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
        cities.forEach { city in
            let coordinates = Coordinates(lat: city.latitude, lon: city.longitude)
            networking.fetchCurrentWeatherForCity(coordinates: coordinates.stringValue) { response in
                self.handleCityWeatherResponse(city: city, response: response, completion: completion)
            }
        }
    }
}

private extension CityListWorkerImpl {

    //TODO: Apply sortCity method after proper build of fetchCitiesWeather method
    private func sortCity(city: [CityWeather]) -> [CityWeather] {
        return city.sorted(by: { $0.city < $1.city })
    }

    private func handleCityWeatherResponse(city: City, response: Result<CityListAPIResponse, Error>, completion: FetchWeatherCompletion?) {
        var responses = [Result<CityListAPIResponse, Error>]()
        responses.append(response)
    }
}
