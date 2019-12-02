//
//  CityHistoricalInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityHistoricalInteractor {
    func getCityDetails()
    func getCityHistoricalWeather(date: Date)
}

final class CityHistoricalInteractorImpl {

    private let cityDetails: CityWeather
    private let presenter: CityHistoricalPresenter
    private let worker: CityHistoricalWorker
    private let router: CityHistoricalRouter

    init(cityDetails: CityWeather,
         presenter: CityHistoricalPresenter,
         worker: CityHistoricalWorker,
         router: CityHistoricalRouter) {
        self.cityDetails = cityDetails
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension CityHistoricalInteractorImpl: CityHistoricalInteractor {

    func getCityDetails() {
        presenter.displayCityDetails(cityDetails)
    }

    func getCityHistoricalWeather(date: Date) {
        
        //TODO: Change to cityDetails.id after proper setup of DB and removing networking mock
        let id = cityDetails.city
        presenter.toggleSpinner(true)
        worker.fetchCityHistoricalWeather(id: id, date: date) { [weak self] result in
            self?.presenter.toggleSpinner(false)
            switch result {
            case .success(let cityHistorical):
                self?.presenter.displayCityHistoricalWeather(cityHistorical)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
}
