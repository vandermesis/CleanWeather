//
//  CityHistoricalPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityHistoricalPresenter: SpinnerPresenter, AlertPresenter {
    func presentCityDetails(_ cityDetails: CityWeather)
    func presentCityHistoricalWeather(_ cityHistorical: CityHistorical)
    func presentFormatedDate(_ date: Date)
}

final class CityHistoricalPresenterImpl<T: CityHistoricalPresentable>: SharedPresenter<T> {}

extension CityHistoricalPresenterImpl: CityHistoricalPresenter {

    func presentCityDetails(_ cityDetails: CityWeather) {
        let displayable = CityCurrentDisplayable(object: cityDetails)
        controller?.displayCityDetails(displayable)
    }

    func presentCityHistoricalWeather(_ cityHistorical: CityHistorical) {
        let displayable = CityHistoricalDisplayable(object: cityHistorical)
        controller?.displayCityHistorical(displayable)
    }

    func presentFormatedDate(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let stringFromDate = dateFormatter.string(from: date)
        controller?.displayFormattedDate(stringFromDate)
    }
}
