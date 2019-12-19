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
        let convertedDate = unixFormatDate(date: date)
        let coordinates = "\(cityDetails.latitude),\(cityDetails.longitude)"
        let id = cityDetails.id
        let name = cityDetails.city
        networking.fetchHistoricalWeatherForCity(coordinates: coordinates, date: convertedDate) { result in
            switch result {
            case .success(let apiResponse):
                print(apiResponse)
                guard let temp = apiResponse.currently.temperature else {
                    completion?(.failure(MissingAPIData()))
                    return
                }
                let cityHistoricalWeather = CityHistorical(id: id,
                                                           city: name,
                                                           temperature: temp,
                                                           icon: apiResponse.currently.icon ?? "")
                completion?(.success(cityHistoricalWeather))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}

private extension CityHistoricalWorkerImpl {

    private func unixFormatDate(date: Date) -> Double {
        return date.timeIntervalSince1970
    }
}
