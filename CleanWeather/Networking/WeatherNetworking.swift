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

    let darkskyUrlPath = "https://api.darksky.net/forecast/598abc19ca5e8af71b5f7110f11d1ccf/"
    
    func fetchCurrentWeatherForCity(coordinates: String, completion: FetchWeatherResponseCompletion?) {
        let urlParams = "?exclude=minutely,hourly,daily,flags,alerts&lang=en&units=si"
        let httpRequest = Request(url: darkskyUrlPath + coordinates + urlParams, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }
    
    func fetchForecastWeatherForCity(coordinates: String, completion: FetchForecastResponseCompletion?) {
        let urlParams = "?exclude=currently,minutely,daily,flags,alerts&lang=en&units=si"
        let httpRequest = Request(url: darkskyUrlPath + coordinates + urlParams, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }

    func fetchHistoricalWeatherForCity(coordinates: String, date: Double, completion: FetchHistoricalResponseCompletion?) {
        let urlParams = "?exclude=minutely,hourly,daily,flags,alerts&lang=en&units=si"
        let urlDate = ",\(Int(date))"
        let httpRequest = Request(url: darkskyUrlPath + coordinates + urlDate + urlParams, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }
    
    func fetchCities(completion: FetchCitiesResponseCompletion?) {
        let url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=worldcitiespop&lang=pl&sort=population&facet=country&refine.country=pl"
        let httpRequest = Request(url: url, method: .get, completion: completion)
        client.perform(request: httpRequest)
    }
}
