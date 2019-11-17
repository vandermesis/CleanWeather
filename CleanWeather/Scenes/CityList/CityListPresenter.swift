//
//  CityListPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListPresenter {
    func displayCitiesWeather(citiesWeather: [CityWeather])
    func displayError(error: Error)
    func showSpinner(_ state: Bool)
}

final class CityListPresenterImpl {
    
    weak var controller: CityListPresentable?
    
}

extension CityListPresenterImpl: CityListPresenter {
    
    func displayCitiesWeather(citiesWeather: [CityWeather]) {
        let displayable = citiesWeather.map { CityWeatherDisplayable(object: $0)}
        controller?.displayCity(displayable)
    }
    
    func displayError(error: Error) {
        controller?.presentAlert(title: "Error", message: error.userFriendlyMessage)
    }
    
    func showSpinner(_ state: Bool) {
        controller?.presentSpinner(state)
    }
}
