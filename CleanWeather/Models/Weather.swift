//
//  Weather.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct Weather: Codable {
    
    enum WeatherSymbol: String {
        case clearDay = "clear-day"
        case clearNight = "clear-night"
        case partlyCloudyDay = "partly-cloudy-day"
        case partlyCloudyNight = "partly-cloudy-night"
        case cloudy
        case fog
        case rain
        case sleet
        case snow
        case wind
        case umbrella
        case isEmpty
    }
    
    let city: String
    let temperature: Double
    let hourlyTempMin: [Double]
    let hourlyTempMax: [Double]
    let dailyTempMin: [Double]
    let dailyTempMax: [Double]
    let icon: String
    
    var symbol: WeatherSymbol {
        return WeatherSymbol(rawValue: icon) ?? .isEmpty
    }
}
