//
//  WeatherNetworking.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchWeatherCompletion = (Result<[CityWeather], Error>) -> Void
typealias FetchForecastResponseCompletion = (Result<CityForecastAPIResponse, Error>) -> Void
typealias FetchHistoricalResponseCompletion = (Result<CityHistoricalAPIResponse, Error>) -> Void
typealias FetchCitiesResponseCompletion = (Result<CitiesAPIResponse, Error>) -> Void

protocol WeatherNetworking {
    func fetchCurrentWeatherForAllCities(completion: FetchWeatherCompletion?)
    func fetchForecastWeatherForCity(coordinates: String, completion: FetchForecastResponseCompletion?)
    func fetchHistoricalWeatherForCity(coordinates: String, date: Double, completion: FetchHistoricalResponseCompletion?)
    func fetchCities(completion: FetchCitiesResponseCompletion?)
}

final class WeatherNetworkingImpl: BaseNetworking, WeatherNetworking {
    
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
                                              latitude: 50,
                                              longitude: 10,
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
    
    func fetchForecastWeatherForCity(coordinates: String, completion: FetchForecastResponseCompletion?) {
        let urlPath = "https://api.darksky.net/forecast/598abc19ca5e8af71b5f7110f11d1ccf/"
        let urlParams = "?exclude=currently,minutely,daily,flags,alerts&lang=en&units=si"
        let httpRequest = Request(url: urlPath + coordinates + urlParams, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }

    func fetchHistoricalWeatherForCity(coordinates: String, date: Double, completion: FetchHistoricalResponseCompletion?) {
        let urlPath = "https://api.darksky.net/forecast/598abc19ca5e8af71b5f7110f11d1ccf/"
        let urlParams = "?exclude=minutely,hourly,daily,flags,alerts&lang=en&units=si"
        let urlDate = ",\(Int(date))"
        let httpRequest = Request(url: urlPath + coordinates + urlDate + urlParams, method: .get, completion: completion)
        print(httpRequest.url)
        client.perform(request: httpRequest)
    }
    
    func fetchCities(completion: FetchCitiesResponseCompletion?) {
        let url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=worldcitiespop&lang=pl&sort=population&facet=country&refine.country=pl&rows=100"
        let httpRequest = Request(url: url, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }
}
