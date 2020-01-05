//
//  CityForecastWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias CityForecast = ([CityHourlyForecast], [CityDailyForecast])
typealias FetchForecastCompletion = (Result<CityForecast, Error>) -> Void

protocol CityForecastWorker {
    func fetchCityForecast(coordinates: String, completion: FetchForecastCompletion?)
}

final class CityForecastWorkerImpl {
    
    private let networking: WeatherNetworking
    
    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}

extension CityForecastWorkerImpl: CityForecastWorker {
    
    func fetchCityForecast(coordinates: String, completion: FetchForecastCompletion?) {
        networking.fetchForecastWeatherForCity(coordinates: coordinates) { result in
            switch result {
            case .success(let apiResponse):
                print(apiResponse)
                let cityHourlyForecast = apiResponse.hourly.data.map { CityHourlyForecast(coordinates: coordinates,
                                                                                          dateTimestamp: $0.time,
                                                                                          temperature: $0.temperature,
                                                                                          precipProbability: $0.precipProbability,
                                                                                          icon: $0.icon)}
                let cityDailyForecast = apiResponse.daily.data.map { CityDailyForecast(coordinates: coordinates,
                                                                                       dateTimestamp: $0.time,
                                                                                       maxTemperature: $0.temperatureHigh,
                                                                                       minTemperatyre: $0.temperatureLow,
                                                                                       precipProbability: $0.precipProbability,
                                                                                       icon: $0.icon)}
                let cityForecast = (cityHourlyForecast, cityDailyForecast)
                completion?(.success(cityForecast))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
