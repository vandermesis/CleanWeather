//
//  CityForecastAPIResponse.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 18/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityForecastAPIResponse: Codable, Equatable {

    let hourly: HourlyForecast
    let daily: DailyForecast
}

struct HourlyForecast: Codable, Equatable {

    let data: [ForecastWeather]

    struct ForecastWeather: Codable, Equatable {

        let time: Double
        let icon: String
        let precipProbability: Double
        let temperature: Double
    }
}

struct DailyForecast: Codable, Equatable {

    let data: [ForecastWeather]

    struct ForecastWeather: Codable, Equatable {

        let time: Double
        let icon: String
        let precipProbability: Double
        let temperatureLow: Double
        let temperatureHigh: Double
    }
}
