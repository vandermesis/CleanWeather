//
//  CityListViewModelMVVM.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 09/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import Foundation

protocol CityListViewModelMVVMDelegate: class {
    func didUpdateFavouriteCitiesWeather()
    func didFailWithError(error: Error)
}

final class CityListViewModelMVVM {

    var citiesWeather = [CityWeather]()
    
    weak var delegate: CityListViewModelMVVMDelegate?

    private let networking: WeatherNetworking
    private let repository: FavouriteCityRepository

    init(networking: WeatherNetworking, repository: FavouriteCityRepository) {
        self.networking = networking
        self.repository = repository
    }
}

extension CityListViewModelMVVM {

    func getFavouriteCities() {
        repository.fetchFavouriteCities { result in
            switch result {
            case .success(let cities):
                self.delegateCitiesWeatherResponse(cities: cities, result: result)
            case .failure(let error):
                self.delegate?.didFailWithError(error: error)
            }
        }
    }
}

private extension CityListViewModelMVVM {

    private func delegateCitiesWeatherResponse(cities: [City], result: Result<[City], Error>) {
        fetchCitiesWeather(cities: cities) { result in
            switch result {
            case .success(let citiesWeather):
                self.citiesWeather = citiesWeather
                self.delegate?.didUpdateFavouriteCitiesWeather()
            case .failure(let error):
                self.delegate?.didFailWithError(error: error)
            }
        }
    }

    private func fetchCitiesWeather(cities: [City], completion: FetchWeatherCompletion?) {
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

    private func convertToCityWeatherResult(city: City, response: Result<CityListAPIResponse, Error>) -> Result<CityWeather, Error> {
        switch response {
        case .failure(let error):
            return .failure(error)
        case .success(let apiResponse):
            guard let cityWeather = convertToCityWeather(city: city, apiResponse: apiResponse) else {
                return.failure(MissingAPIData())
            }
            return .success(cityWeather)
        }
    }

    private func convertToCityWeather(city: City, apiResponse: CityListAPIResponse) -> CityWeather? {
        guard let temp = apiResponse.currently.temperature else { return nil }
        return CityWeather(id: city.id,
                           city: city.name,
                           latitude: city.latitude,
                           longitude: city.longitude,
                           temperature: temp,
                           icon: apiResponse.currently.icon ?? "")
    }

    private func handleCityWeatherResponse(cities: [City], responses: [Result<CityWeather, Error>], completion: FetchWeatherCompletion?) {
        guard cities.count == responses.count else { return }
        let citiesWeatherListResult = convertToCityWeatherListResult(responses: responses)
        completion?(citiesWeatherListResult)
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
        return .success(citiesWeather.sortByName())
    }
}
