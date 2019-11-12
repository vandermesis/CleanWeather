//
//  CitiesDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct CitiesDisplayable {
    
    let cityName: String
    let cityWeatherIcon: String
    let cityTempRounded: Int
    
    static func convert(from object: Weather) -> CitiesDisplayable {
        
        let temp = Int(object.temperature.rounded())
        
        var icon: String {
            switch object.symbol {
            case .clearDay:
                return "sun.max"
            case .clearNight:
                return "moon"
            case .cloudy:
                return "cloud"
            case .fog:
                return "cloud.fog"
            case .partlyCloudyDay:
                return "cloud.sun"
            case .partlyCloudyNight:
                return "cloud.moon"
            case .rain:
                return "cloud.rain"
            case .sleet:
                return "cloud.sleet"
            case .snow:
                return "cloud.snow"
            case .wind:
                return "wind"
            default:
                return "nosign"
            }
        }
        
        return CitiesDisplayable(cityName: object.city, cityWeatherIcon: icon, cityTempRounded: temp)
    }
}
