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
    func presentFormattedDate(_ date: Date)
}

final class CityHistoricalPresenterImpl<T: CityHistoricalPresentable>: SharedPresenter<T> {

    var dateFormatter: DateFormatterSingleton

    init (dateFormatter: DateFormatterSingleton) {
        self.dateFormatter = dateFormatter
    }
}

extension CityHistoricalPresenterImpl: CityHistoricalPresenter {

    func presentCityDetails(_ cityDetails: CityWeather) {
        let displayable = CityCurrentDisplayable(object: cityDetails)
        controller?.displayCityDetails(displayable)
    }

    func presentCityHistoricalWeather(_ cityHistorical: CityHistorical) {
        let displayable = CityHistoricalDisplayable(object: cityHistorical)
        controller?.displayCityHistorical(displayable)
    }

    func presentFormattedDate(_ date: Date) {
        let stringFromDate = dateFormatter.formatToString(date: date)
        controller?.displayFormattedDate(stringFromDate)
    }
}
