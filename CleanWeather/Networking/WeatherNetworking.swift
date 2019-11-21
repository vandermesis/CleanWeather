//
//  WeatherNetworking.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchWeatherCompletion = (Result<[CityWeather], Error>) -> Void
typealias FetchForecastCompletion = (Result<CityWeatherDetails, Error>) -> Void

protocol WeatherNetworking {
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?)
    func fetchForecastWeatherForCity(completion: FetchForecastCompletion?)
}

final class WeatherNetworkingImpl: WeatherNetworking {
    
    //TODO: Build networking and remove mock
    
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?) {
        
        var randomId: String {
            let id = UUID()
            return id.uuidString
        }
        
        var randomCity: String {
            let city = ["Katowice", "Gdańsk", "Tokyo", "New York", "Ljubliana", "Berlin", "Sydney", "Szanghaj", "Moskwa", "Paryż"]
            let random = Int.random(in: 0...9)
            return city[random]
        }
        
        var randomTemp: Double {
            return Double.random(in: -30...30)
        }
        
        var randomIcon: String {
            let icon = ["clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night", "cloudy", "fog", "rain", "sleet", "snow", "wind"]
            let random = Int.random(in: 0...9)
            return icon[random]
        }
        
        var randomCityWeahter: [CityWeather] {
            var array = [CityWeather]()
            for _ in 0...20 {
                let cityWeather = CityWeather(id: randomId,
                                              city: randomCity,
                                              temperature: randomTemp,
                                              icon: randomIcon)
                array.append(cityWeather)
            }
            return array
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion?(Result.success(randomCityWeahter))
        }
    }
    
    func fetchForecastWeatherForCity(completion: FetchForecastCompletion?) {
        
        var randomId: String {
            let id = UUID()
            return id.uuidString
        }
    
        var hours: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        
        var randomTemp: [Double] {
            var array = [Double]()
            for _ in 0...9 {
                let random = Double.random(in: -30...30)
                array.append(random)
            }
            return array
        }
        
        var randomPrecip: [Double] {
            var array = [Double]()
            for _ in 0...9 {
                let random = Double.random(in: 0...100)
                array.append(random)
            }
            return array
        }
        
        var randomIcon: String {
            let icon = ["clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night", "cloudy", "fog", "rain", "sleet", "snow", "wind"]
            let random = Int.random(in: 0...9)
            return icon[random]
        }
        
        var randomCityDetails: CityWeatherDetails {
            return CityWeatherDetails(id: randomId, hour: hours, hourTemp: randomTemp, hourPrecipProbability: randomPrecip, icon: randomIcon)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion?(Result.success(randomCityDetails))
        }
    }
}
