//
//  CityForecastPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityForecastPresenter: SpinnerPresenter, AlertPresenter {
    func presentCityDetails(_ cityDetails: CityWeather)
    func presentCityForecastList(_ forecast: CityForecast)
}

final class CityForecastPresenterImpl<T: CityForecastPresentable>: SharedPresenter<T> {}

extension CityForecastPresenterImpl: CityForecastPresenter {
    
    func presentCityDetails(_ cityDetails: CityWeather) {
        let displayable = CityForecastDisplayable(object: cityDetails)
        controller?.displayCityDetails(displayable)
    }
    
    func presentCityForecastList(_ forecast: CityForecast) {
        let hourlyForecast = forecast.hourly
        let dailyForecast = forecast.daily
        let hourlyForecastDisplayable = hourlyForecast.map { CityHourlyForecastListDisplayable(object: $0) }
        let dailyForecastDisplayable = dailyForecast.map { CityDailyForecastListDisplayable(object: $0)}
        controller?.displayCityForecast(hourlyForecast: hourlyForecastDisplayable,
                                        dailyForecast: dailyForecastDisplayable)
    }
}
