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
       var responses = [Result<CityWeather, Error>]()
        cities.forEach { city in
            let coordinates = Coordinates(lat: city.latitude, lon: city.longitude)
            networking.fetchCurrentWeatherForCity(coordinates: coordinates.stringValue) { response in
                let cityWeatherResult = self.convertToCityWeatherResult(city: city, response: response)
                responses.append(cityWeatherResult)
                self.handleCityWeatherResponse(cities: cities, responses: responses, completion: completion)
            }
        }
    }
}

private extension CityListWorkerImpl {

    private func handleCityWeatherResponse(cities: [City], responses: [Result<CityWeather, Error>], completion: FetchWeatherCompletion?) {
        guard cities.count == responses.count else { return }
        let citiesWeatherListResult = convertToCityWeatherListResult(responses: responses)
        completion?(citiesWeatherListResult)
    }

    private func convertToCityWeatherResult(city: City, response: Result<CityListAPIResponse, Error>) -> Result<CityWeather, Error> {
        switch response {
        case .failure(let error):
            return .failure(error)
        case .success(let apiResponse):
            guard let temp = apiResponse.currently.temperature else {
                return .failure(MissingAPIData())
            }
            let cityWeather = CityWeather(id: city.id,
                                          city: city.name,
                                          latitude: city.latitude,
                                          longitude: city.longitude,
                                          temperature: temp,
                                          icon: apiResponse.currently.icon ?? "")
            return .success(cityWeather)
        }
    }

    private func convertToCityWeatherListResult(responses: [Result<CityWeather, Error>]) -> Result<[CityWeather], Error> {
        var citiesWeather = [CityWeather]()
        var errors = [Error]()
        responses.forEach { response in
            switch response {
            case .success(let cityWeather):
                citiesWeather.append(cityWeather)
            case .failure(let error):
                errors.append(error)
            }
        }
        if let firstError = errors.first {
            return .failure(firstError)
        }
        return .success(citiesWeather.sortCitiesWeatherByName())
    }
}
