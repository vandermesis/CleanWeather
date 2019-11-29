//
//  CityListPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresenter: SpinnerPresenter, AlertPresenter {
    func displayCitiesWeather(citiesWeather: [CityWeather])
}

final class CityListPresenterImpl<T: CityListPresentable>: SharedPresenter<T> {
        
}

extension CityListPresenterImpl: CityListPresenter {
    
    func displayCitiesWeather(citiesWeather: [CityWeather]) {
        let displayable = citiesWeather.map { CityWeatherDisplayable(object: $0)}
        controller?.displayCity(displayable)
    }
}
