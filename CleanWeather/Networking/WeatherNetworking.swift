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
            var array = [Double]()
            for _ in 0...20 {
                let random = Double.random(in: -30...30)
                array.append(random)
            }
            return array
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion?(Result.success([
                CityWeather(city: "Katowice",
                            temperature: randomTemp[0],
                            hourlyTempMin: [randomTemp[1], randomTemp[2], randomTemp[3], randomTemp[4], randomTemp[5]],
                            hourlyTempMax: [randomTemp[6], randomTemp[7], randomTemp[8], randomTemp[9], randomTemp[10]],
                            dailyTempMin: [randomTemp[11], randomTemp[12], randomTemp[13], randomTemp[14], randomTemp[15]],
                            dailyTempMax: [randomTemp[16], randomTemp[17], randomTemp[18], randomTemp[19], randomTemp[20]],
                            icon: "clear-day"),
                CityWeather(city: "Gdańsk",
                            temperature: randomTemp[0],
                            hourlyTempMin: [randomTemp[1], randomTemp[2], randomTemp[3], randomTemp[4], randomTemp[5]],
                            hourlyTempMax: [randomTemp[6], randomTemp[7], randomTemp[8], randomTemp[9], randomTemp[10]],
                            dailyTempMin: [randomTemp[11], randomTemp[12], randomTemp[13], randomTemp[14], randomTemp[15]],
                            dailyTempMax: [randomTemp[16], randomTemp[17], randomTemp[18], randomTemp[19], randomTemp[20]],
                            icon: "cloudy"),
                CityWeather(city: "Tokyo",
                            temperature: randomTemp[0],
                            hourlyTempMin: [randomTemp[1], randomTemp[2], randomTemp[3], randomTemp[4], randomTemp[5]],
                            hourlyTempMax: [randomTemp[6], randomTemp[7], randomTemp[8], randomTemp[9], randomTemp[10]],
                            dailyTempMin: [randomTemp[11], randomTemp[12], randomTemp[13], randomTemp[14], randomTemp[15]],
                            dailyTempMax: [randomTemp[16], randomTemp[17], randomTemp[18], randomTemp[19], randomTemp[20]],
                            icon: "clear-night"),
                CityWeather(city: "New York",
                            temperature: randomTemp[0],
                            hourlyTempMin: [randomTemp[1], randomTemp[2], randomTemp[3], randomTemp[4], randomTemp[5]],
                            hourlyTempMax: [randomTemp[6], randomTemp[7], randomTemp[8], randomTemp[9], randomTemp[10]],
                            dailyTempMin: [randomTemp[11], randomTemp[12], randomTemp[13], randomTemp[14], randomTemp[15]],
                            dailyTempMax: [randomTemp[16], randomTemp[17], randomTemp[18], randomTemp[19], randomTemp[20]],
                            icon: "rain"),
                CityWeather(city: "Ljubliana",
                            temperature: randomTemp[0],
                            hourlyTempMin: [randomTemp[1], randomTemp[2], randomTemp[3], randomTemp[4], randomTemp[5]],
                            hourlyTempMax: [randomTemp[6], randomTemp[7], randomTemp[8], randomTemp[9], randomTemp[10]],
                            dailyTempMin: [randomTemp[11], randomTemp[12], randomTemp[13], randomTemp[14], randomTemp[15]],
                            dailyTempMax: [randomTemp[16], randomTemp[17], randomTemp[18], randomTemp[19], randomTemp[20]],
                            icon: "wind")
            ]))
        }
    }
}
