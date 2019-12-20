//
//  CityHistoricalWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchHistoricalCompletion = (Result<CityHistorical, Error>) -> Void

protocol CityHistoricalWorker {
    func fetchCityHistoricalWeather(cityDetails: CityWeather, date: Date, completion: FetchHistoricalCompletion?)
}

final class CityHistoricalWorkerImpl {

    private let networking: WeatherNetworking

    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}

extension CityHistoricalWorkerImpl: CityHistoricalWorker {

    func fetchCityHistoricalWeather(cityDetails: CityWeather, date: Date, completion: FetchHistoricalCompletion?) {
        let coordinates = Coordinates(lat: cityDetails.latitude, lon: cityDetails.longitude)
        networking.fetchHistoricalWeatherForCity(coordinates: coordinates.coordinatesString(), date: date.timeIntervalSince1970) { result in
            switch result {
            case .success(let apiResponse):
                guard let temp = apiResponse.currently.temperature else {
                    completion?(.failure(MissingAPIData()))
                    return
                }
                let cityHistoricalWeather = CityHistorical(id: cityDetails.id,
                                                           city: cityDetails.city,
                                                           temperature: temp,
                                                           icon: apiResponse.currently.icon ?? "")
                completion?(.success(cityHistoricalWeather))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
