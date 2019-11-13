//
//  Weather.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct Weather: Codable {
    
    enum SFsymbol: String {
        case clearDay = "clear-day"
        case clearNight = "clear-night"
        case cloudy = "cloudy"
        case fog = "fog"
        case partlyCloudyDay = "partly-cloudy-day"
        case partlyCloudyNight = "partly-cloudy-night"
        case rain = "rain"
        case sleet = "sleet"
        case snow = "snow"
        case wind = "wind"
        case umbrella = "umbrella"
        case isEmpty = "nosign"
    }
    
    let city: String
    let temperature: Double
    let hourlyTempMin: [Double]
    let hourlyTempMax: [Double]
    let dailyTempMin: [Double]
    let dailyTempMax: [Double]
    let icon: String
    
    var symbol: SFsymbol {
        return SFsymbol(rawValue: icon) ?? .isEmpty
    }
}
