//
//  WeatherNetworking.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

typealias FetchWeatherResponseCompletion = (Result<CityListAPIResponse, Error>) -> Void
typealias FetchForecastResponseCompletion = (Result<CityForecastAPIResponse, Error>) -> Void
typealias FetchHistoricalResponseCompletion = (Result<CityHistoricalAPIResponse, Error>) -> Void
typealias FetchCitiesResponseCompletion = (Result<CitiesAPIResponse, Error>) -> Void

protocol WeatherNetworking {
    func fetchCurrentWeatherForCity(coordinates: String, completion: FetchWeatherResponseCompletion?)
    func fetchForecastWeatherForCity(coordinates: String, completion: FetchForecastResponseCompletion?)
    func fetchHistoricalWeatherForCity(coordinates: String, date: Double, completion: FetchHistoricalResponseCompletion?)
    func fetchCities(completion: FetchCitiesResponseCompletion?)
}

final class WeatherNetworkingImpl: BaseNetworking, WeatherNetworking {
    
    func fetchCurrentWeatherForCity(coordinates: String, completion: FetchWeatherResponseCompletion?) {
        let urlParams = "?exclude=minutely,hourly,daily,flags,alerts&lang=en&units=si"
        let httpRequest = Request(url: APIURL.darkSky + coordinates + urlParams, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }
    
    func fetchForecastWeatherForCity(coordinates: String, completion: FetchForecastResponseCompletion?) {
        let urlParams = "?exclude=currently,minutely,flags,alerts&lang=en&units=si"
        let httpRequest = Request(url: APIURL.darkSky + coordinates + urlParams, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }

    func fetchHistoricalWeatherForCity(coordinates: String, date: Double, completion: FetchHistoricalResponseCompletion?) {
        let urlParams = "?exclude=minutely,hourly,daily,flags,alerts&lang=en&units=si"
        let urlDate = ",\(Int(date))"
        let httpRequest = Request(url: APIURL.darkSky + coordinates + urlDate + urlParams, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }
    
    func fetchCities(completion: FetchCitiesResponseCompletion?) {
        let urlParams = "?dataset=worldcitiespop&lang=pl&sort=population&facet=country&refine.country=pl&rows=100"
        let httpRequest = Request(url: APIURL.openDataSoft + urlParams, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }
}
