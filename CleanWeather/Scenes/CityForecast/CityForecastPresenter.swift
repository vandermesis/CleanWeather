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
    func presentCityDetailsList(_ forecast: [CityForecast])
}

final class CityForecastPresenterImpl<T: CityForecastPresentable>: SharedPresenter<T> {}

extension CityForecastPresenterImpl: CityForecastPresenter {
    
    func presentCityDetails(_ cityDetails: CityWeather) {
        let displayable = CityForecastDisplayable(object: cityDetails)
        controller?.displayCityDetails(displayable)
    }
    
    func presentCityDetailsList(_ forecast: [CityForecast]) {
        let displayable = forecast.map { CityForecastListDisplayable(object: $0) }
        controller?.displayCityForecast(displayable)
    }
}
