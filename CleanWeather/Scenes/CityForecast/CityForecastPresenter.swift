//
//  CityForecastPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityForecastPresenter: SpinnerPresenter, AlertPresenter {
    func displayCityDetails(_ cityDetails: CityWeather)
    func displayCityDetailsList(_ forecast: [CityForecast])
}

final class CityForecastPresenterImpl<T: CityForecastPresentable>: SharedPresenter<T> {
    
}

extension CityForecastPresenterImpl: CityForecastPresenter {
    
    func displayCityDetails(_ cityDetails: CityWeather) {
        let displayable = CityForecastDisplayable(object: cityDetails)
        controller?.displayCityDetails(displayable)
    }
    
    func displayCityDetailsList(_ forecast: [CityForecast]) {
        let displayable = forecast.map { CityForecastListDisplayable(object: $0) }
        controller?.displayCityForecast(displayable)
    }
}
