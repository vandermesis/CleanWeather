//
//  CityForecastInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityForecastInteractor {
    func updateUIWithPassedData()
    func getCityHourDetailsList()
}

final class CityForecastInteractorImpl {
    
    private let presenter: CityForecastPresenter
    private let worker: CityForecastWorker
    private let router: CityForecastRouter
    private let passedCityWeather: CityWeather
    
    init(presenter: CityForecastPresenter,
         worker: CityForecastWorker,
         router: CityForecastRouter,
         passedData: CityWeather) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
        self.passedCityWeather = passedData
    }
}

extension CityForecastInteractorImpl: CityForecastInteractor {
    
    func updateUIWithPassedData() {
        presenter.displayCityDetails(from: passedCityWeather)
    }
    
    func getCityHourDetailsList() {
        let id = passedCityWeather.id
        presenter.toggleSpinner(true)
        worker.fetchCityHourDetailsList(with: id) { [weak self] result in
            self?.presenter.toggleSpinner(false)
            switch result {
            case .success(let detailsList):
                self?.presenter.displayCityDetailsList(from: detailsList)
            case .failure(let error):
                self?.presenter.presentAlert(title: R.string.localizable.error(), message: error.userFriendlyMessage)
            }
        }
    }
}
