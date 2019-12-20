//
//  CityForecastInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityForecastInteractor {
    func getCityDetails()
    func getCityForecast()
    func didPressHistoryButton()
}

final class CityForecastInteractorImpl {

    private let cityDetails: CityWeather
    private let presenter: CityForecastPresenter
    private let worker: CityForecastWorker
    private let router: CityForecastRouter

    init(cityDetails: CityWeather,
         presenter: CityForecastPresenter,
         worker: CityForecastWorker,
         router: CityForecastRouter) {
        self.cityDetails = cityDetails
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension CityForecastInteractorImpl: CityForecastInteractor {
    
    func getCityDetails() {
        presenter.presentCityDetails(cityDetails)
    }
    
    func getCityForecast() {
        let coordinates = "\(cityDetails.latitude),\(cityDetails.longitude)"
        presenter.toggleSpinner(true)
        worker.fetchCityHourlyForecast(coordinates: coordinates) { [weak self] result in
            self?.presenter.toggleSpinner(false)
            switch result {
            case .success(let detailsList):
                self?.presenter.presentCityDetailsList(detailsList)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }

    func didPressHistoryButton() {
        router.navigateToCityHistorical(cityWeather: cityDetails)
    }
}
