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
}

final class CityForecastInteractorImpl {
    
    private let presenter: CityForecastPresenter
    private let worker: CityForecastWorker
    private let router: CityForecastRouter
    private let cityDetails: CityWeather
    
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
        presenter.displayCityDetails(cityDetails)
    }
    
    func getCityForecast() {
        let id = cityDetails.id
        presenter.toggleSpinner(true)
        worker.fetchCityHourDetailsList(id: id) { [weak self] result in
            self?.presenter.toggleSpinner(false)
            switch result {
            case .success(let detailsList):
                self?.presenter.displayCityDetailsList(detailsList)
            case .failure(let error):
                self?.presenter.presentAlert(title: R.string.localizable.error(), message: error.userFriendlyMessage)
            }
        }
    }
}
