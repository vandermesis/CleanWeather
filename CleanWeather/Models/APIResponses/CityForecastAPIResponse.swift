//
//  CityForecastAPIResponse.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 18/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct CityForecastAPIResponse: Codable, Equatable {

    let hourly: Hour

    struct Hour: Codable, Equatable {

        let data: [WeatherData]

        struct WeatherData: Codable, Equatable {

            let time: Double
            let icon: String
            let precipProbability: Double
            let temperature: Double

        }
    }
}
