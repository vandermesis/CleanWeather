//
//  CityForecastWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityForecastWorker {
    func fetchCityHourDetailsList(id: String, completion: FetchForecastCompletion?)
}

final class CityForecastWorkerImpl {
    
    private let networking: WeatherNetworking
    
    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}

extension CityForecastWorkerImpl: CityForecastWorker {
    
    func fetchCityHourDetailsList(id: String, completion: FetchForecastCompletion?) {
        networking.fetchForecastWeatherForCity(id: id) { result in
            switch result {
            case .success:
                completion?(result)
            case .failure:
                completion?(result)
            }
        }
    }
}
