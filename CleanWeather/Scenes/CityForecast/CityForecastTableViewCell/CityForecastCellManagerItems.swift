//
//  CityForecastCellManagerItems.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 08/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import Foundation

final class CityForecastCellManagerHourlyForecastItem: CellManagerItem {

    var type: CellManagerItemType {
        return .hourlyForecast
    }

    var rowCount: Int {
        return 1
    }

    var hourlyForecast: [CityHourlyForecastListDisplayable]

    init(hourlyForecast: [CityHourlyForecastListDisplayable]) {
        self.hourlyForecast = hourlyForecast
    }
}

final class CityForecastCellManagerDailyForecastItem: CellManagerItem {

    var type: CellManagerItemType {
        return .dailyForecast
    }

    var rowCount: Int {
        return dailyForecast.count
    }

    var dailyForecast: [CityDailyForecastListDisplayable]

    init(dailyForecast: [CityDailyForecastListDisplayable]) {
        self.dailyForecast = dailyForecast
    }
}
