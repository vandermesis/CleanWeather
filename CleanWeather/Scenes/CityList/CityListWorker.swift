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

    private var cities = [City]()
    private var citiesWeather = [CityWeather]()
    private var errors = [Error]()
    private var responseCounter = 0
    private var errorCounter = 0

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
        self.cities = cities
        self.cities.forEach { city in
            let coordinates = Coordinates(lat: city.latitude, lon: city.longitude)
            networking.fetchCurrentWeatherForCity(coordinates: coordinates.stringValue) { response in
                self.handleCityWeatherResponse(city: city, response: response, completion: completion)
            }
        }
    }
}

private extension CityListWorkerImpl {
    
    private func sortCity(city: [CityWeather]) -> [CityWeather] {
        return city.sorted(by: { $0.city < $1.city })
    }

    private func handleCityWeatherResponse(city: City, response: Result<CityListAPIResponse, Error>, completion: FetchWeatherCompletion?) {
        switch response {
        case .success(let apiResponse):
            if let cityTemperature = apiResponse.currently.temperature {
                let cityWeather = CityWeather(id: city.id,
                                              city: city.name,
                                              latitude: city.latitude,
                                              longitude: city.longitude,
                                              temperature: cityTemperature,
                                              icon: apiResponse.currently.icon ?? "")
                citiesWeather.append(cityWeather)
                responseCounter += 1
            } else {
                errors.append(MissingAPIData())
                errorCounter += 1
            }
        case .failure(let error):
            errors.append(error)
            errorCounter += 1
        }
        if responseCounter == cities.count {
            completion?(.success(citiesWeather))
        }
        if errorCounter > 0 {
            completion?(.failure(MissingAPIData()))
        }

    }
}
