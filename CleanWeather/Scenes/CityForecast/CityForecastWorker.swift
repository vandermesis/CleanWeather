//
//  CityForecastWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchForecastCompletion = (Result<[CityForecast], Error>) -> Void

protocol CityForecastWorker {
    func fetchCityHourlyForecast(coordinates: String, completion: FetchForecastCompletion?)
}

final class CityForecastWorkerImpl {
    
    private let networking: WeatherNetworking
    
    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}

extension CityForecastWorkerImpl: CityForecastWorker {
    
    func fetchCityHourlyForecast(coordinates: String, completion: FetchForecastCompletion?) {
        networking.fetchForecastWeatherForCity(coordinates: coordinates) { result in
            switch result {
            case .success(let apiResponse):
                let cityHourlyForecast = apiResponse.hourly.data.map { CityForecast(id: coordinates,
                                                                                    forecastHour: $0.time,
                                                                                    forecastHourTemp: $0.temperature,
                                                                                    forecastHourPrecipProbability: $0.precipProbability,
                                                                                    icon: $0.icon)}
                completion?(.success(cityHourlyForecast))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
