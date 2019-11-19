//
//  WeatherNetworking.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchWeatherCompletion = (Result<[CityWeather], Error>) -> Void

protocol WeatherNetworking {
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?)
}

final class WeatherNetworkingImpl: WeatherNetworking {
    
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?) {
        
        //TODO: Build networking and remove mock
        
        var randomTemp: [Double] {
            let random = Double.random(in: -30...30)
            return Array(repeating: random, count: 10)
        }
        
        var randomId: String {
            let id = UUID()
            return id.uuidString
        }
        
        var randomIcon: String {
            let icon = ["clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night", "cloudy", "fog", "rain", "sleet", "snow", "wind"]
            let random = Int.random(in: 0...9)
            return icon[random]
        }
        
        var randomCity: String {
            let city = ["Katowice", "Gdańsk", "Tokyo", "New York", "Ljubliana", "Berlin", "Sydney", "Szanghaj", "Moskwa", "Paryż"]
            let random = Int.random(in: 0...9)
            return city[random]
        }
        
        var randomCityWeahter: [CityWeather] {
            var array = [CityWeather]()
            for _ in 0...20 {
                let cityWeather = CityWeather(id: randomId,
                                              city: randomCity,
                                              temperature: randomTemp[0],
                                              hourlyTempMin: randomTemp, hourlyTempMax: randomTemp,
                                              dailyTempMin: randomTemp, dailyTempMax: randomTemp,
                                              icon: randomIcon)
                array.append(cityWeather)
            }
            return array
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion?(Result.success(randomCityWeahter))
        }
    }
}
