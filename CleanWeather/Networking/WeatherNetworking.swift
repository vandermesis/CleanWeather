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
typealias FetchCitiesCompletion = (Result<[City], Error>) -> Void

protocol WeatherNetworking {
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?)
    func fetchForecastWeatherForCity(id: String, completion: FetchForecastCompletion?)
    func fetchHistoricalWeatherForCity(id: String, date: Double, completion: FetchHistoricalCompletion?)
    func fetchCities(completion: FetchCitiesCompletion?)
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

    func fetchHistoricalWeatherForCity(id: String, date: Double, completion: FetchHistoricalCompletion?) {

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

    func fetchCities(completion: FetchCitiesCompletion?) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion?(Result.success([
            City(id: "13803CB5-42DA-46CD-8CE2-0B31C34CDB9F", name: "Katowice", latitude: 50.2605, longitude: 19.0159),
            City(id: "CED7073D-B70C-4F25-A5C7-817827112286", name: "New York", latitude: 40.730610, longitude: -73.935242),
            City(id: "9DA9F26C-579E-402A-88B0-E5138F79EF28", name: "Gdańsk", latitude: 54.372158, longitude: 18.638306),
            City(id: "627314F6-7720-4C92-A331-51B3A4E1C916", name: "Tokyo", latitude: 35.652832, longitude: 139.839478),
            City(id: "5E36DA9F-F4FA-4213-A54B-2D6902FC61B5", name: "Ljubliana", latitude: 50.2605, longitude: 19.0159),
            City(id: "F87F6F82-3B17-4964-B45C-FDA0A1469792", name: "Berlin", latitude: 40.730610, longitude: -73.935242),
            City(id: "5709509B-2333-409F-AC79-1EF65DD0E6B9", name: "Shanghai", latitude: 54.372158, longitude: 18.638306),
            City(id: "0D39A3C2-67BF-4EB7-8926-F3F1381A398E", name: "Sydney", latitude: 35.652832, longitude: 139.839478)
            ]))
        }
    }
}
