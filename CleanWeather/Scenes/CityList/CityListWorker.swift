//
//  CityListWorker.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityListWorker {
    func fetchCityWeather(completion: FetchWeatherCompletion?)
}

final class CityListWorkerImpl {
    
    private let networking: WeatherNetworking
    
    init(networking: WeatherNetworking) {
        self.networking = networking
    }
}

extension CityListWorkerImpl: CityListWorker {
    
    func fetchCityWeather(completion: FetchWeatherCompletion?) {
        networking.fetchCurrentWeatherForAllCities { [weak self] result in
            
            guard let self = self, case .success(let city) = result else {
                completion?(result)
                return
            }
            
            let sortedCity = self.sortCity(city: city)
            completion?(.success(sortedCity))
        }
    }
}

private extension CityListWorkerImpl {
    
    func sortCity(city: [CityWeather]) -> [CityWeather] {
        return city.sorted(by: { $0.city < $1.city })
    }
}
