//
//  WeatherNetworking.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchWeatherCompletion = (Result<[CityWeather], Error>) -> Void
typealias FetchForecastCompletion = (Result<[CityForecast], Error>) -> Void
typealias FetchHistoricalCompletion = (Result<CityHistorical, Error>) -> Void

protocol WeatherNetworking {
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?)
    func fetchForecastWeatherForCity(id: String, completion: FetchForecastCompletion?)
    func fetchHistoricalWeatherForCity(id: String, date: Date, completion: FetchHistoricalCompletion?)
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
            let icon = ["clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night", "cloudy", "fog", "rain", "sleet", "snow", "wind", "invalid"]
            let random = Int.random(in: 0...10)
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion?(Result.success(randomCityWeahter))
        }
    }
    
    func fetchForecastWeatherForCity(id: String, completion: FetchForecastCompletion?) {
    
        var hour: [Int] {
            let hours = 0...23
            return hours.map { $0 }
        }
        
        var randomTemp: Double {
            return Double.random(in: -30...30)
        }
        
        var randomPrecip: Double {
            return Double.random(in: 0...1)
        }
        
        var randomIcon: String {
            let icon = ["clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night", "cloudy", "fog", "rain", "sleet", "snow", "wind"]
            let random = Int.random(in: 0...9)
            return icon[random]
        }
        
        var randomCityHourDetails: [CityForecast] {
            var array = [CityForecast]()
            for i in 0...23 {
                let cityWeatherHour = CityForecast(id: id, hour: hour[i], hourTemp: randomTemp, hourPrecipProbability: randomPrecip, icon: randomIcon)
                array.append(cityWeatherHour)
            }
            return array
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion?(Result.success(randomCityHourDetails))
        }
    }

    func fetchHistoricalWeatherForCity(id: String, date: Date, completion: FetchHistoricalCompletion?) {

        var randomTemp: Double {
            return Double.random(in: -30...30)
        }

        var randomIcon: String {
            let icon = ["clear-day", "clear-night", "partly-cloudy-day", "partly-cloudy-night", "cloudy", "fog", "rain", "sleet", "snow", "wind", "invalid"]
            let random = Int.random(in: 0...10)
            return icon[random]
        }

        let randomHistoricalWeahter = CityHistorical(id: id, city: id, temperature: randomTemp, icon: randomIcon)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion?(Result.success(randomHistoricalWeahter))
        }
    }
}
