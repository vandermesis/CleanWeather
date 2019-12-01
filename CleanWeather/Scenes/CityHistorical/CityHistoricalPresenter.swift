//
//  CityHistoricalPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityHistoricalPresenter: SpinnerPresenter, AlertPresenter {
    func displayCityDetails(_ cityDetails: CityWeather)
    func displayCityHistoricalWeather(_ cityHistorical: CityHistorical)
}

final class CityHistoricalPresenterImpl<T: CityHistoricalPresentable>: SharedPresenter<T> {

}

extension CityHistoricalPresenterImpl: CityHistoricalPresenter {

    func displayCityDetails(_ cityDetails: CityWeather) {
        let displayable = CityCurrentDisplayable(object: cityDetails)
        controller?.displayCityDetails(displayable)
    }

    func displayCityHistoricalWeather(_ cityHistorical: CityHistorical) {
        let displayable = CityHistoricalDisplayable(object: cityHistorical)
        controller?.displayCityHistorical(displayable)
    }
}
