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

final class WeatherNetworkingImpl: BaseNetworking, WeatherNetworking {
    
    //TODO: Build networking and remove mock
    
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?) {

        //TODO: Change random id to ids matching cities from favourite cities
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
        let url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=worldcitiespop&lang=pl&sort=population&facet=country&refine.country=pl"
        
        // w RESTowym API parametry mozna przekazywać na dwojaki sposób, albo URLU i tak się dzieje jak robimy GETa, bo GET nie ma body
        // jak jest POST to mozna parametry zserializowac w JSONA i wyslac je w body
        // ogolnie dobrze jest zrobic tez zeby nie bylo tak jak jest teraz i wrzucic te urlcomponents, ale chyba na poczatku mozna to zostawic
        // ja nie uzywam w ogole query items i components
        let httpRequest = Request(url: url, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }
}
