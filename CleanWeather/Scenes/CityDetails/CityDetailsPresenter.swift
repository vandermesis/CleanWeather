//
//  CityDetailsPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityDetailsPresenter: SpinnerPresenter, AlertPresenter {
    func displayCityDetails(from: CityWeather)
    func displayCityDetailsList(from detailsList: CityWeatherDetails)
}

final class CityDetailsPresenterImpl: SharedPresenter<CityDetailsController> {
    
}

extension CityDetailsPresenterImpl: CityDetailsPresenter {
    
    func displayCityDetails(from: CityWeather) {
        let displayable = CityDetailsDisplayable(object: from)
        controller?.displayCityDetails(displayable)
    }
    
    func displayCityDetailsList(from detailsList: CityWeatherDetails) {
        let displayable = CityDetailsListDisplayable(object: detailsList)
        controller?.displayCityDetailsList(displayable)
    }
}
