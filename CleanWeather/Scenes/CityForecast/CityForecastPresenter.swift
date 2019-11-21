//
//  CityForecastPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityForecastPresenter: SpinnerPresenter, AlertPresenter {
    func displayCityDetails(from passedData: CityWeather)
    func displayCityDetailsList(from detailsList: [CityForecast])
}

final class CityForecastPresenterImpl: SharedPresenter<CityForecastController> {
    
}

extension CityForecastPresenterImpl: CityForecastPresenter {
    
    func displayCityDetails(from passedData: CityWeather) {
        let displayable = CityForecastDisplayable(object: passedData)
        controller?.displayCityDetails(displayable)
    }
    
    func displayCityDetailsList(from detailsList: [CityForecast]) {
        let displayable = detailsList.map { CityForecastListDisplayable(object: $0) }
        controller?.displayCityDetailsList(displayable)
    }
}
