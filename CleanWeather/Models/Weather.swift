//
//  Weather.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

struct Weather: Codable {
    
    enum SFsymbol: String {
        case clearDay = "sun.max"
        case clearNight = "moon"
        case cloudy = "cloud"
        case fog = "cloud.fog"
        case partlyCloudyDay = "cloud.sun"
        case partlyCloudyNight = "cloud.moon"
        case rain = "cloud.rain"
        case sleet = "cloud.sleet"
        case snow = "cloud.snow"
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
