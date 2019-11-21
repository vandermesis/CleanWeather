//
//  CityDetailsWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityDetailsWorker {
    func fetchCityDetailsList(completion: FetchForecastCompletion?)
}

final class CityDetailsWorkerImpl {
    
    private let networking: WeatherNetworking
    
    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}

extension CityDetailsWorkerImpl: CityDetailsWorker {
    
    func fetchCityDetailsList(completion: FetchForecastCompletion?) {
        networking.fetchForecastWeatherForCity { [weak self] result in
            
            guard let _ = self, case .success(let city) = result else {
                completion?(result)
                return
            }
            completion?(.success(city))
        }
    }
}
