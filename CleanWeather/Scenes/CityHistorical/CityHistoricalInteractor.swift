//
//  CityHistoricalInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityHistorialInteractor {
    func getCityDetails()
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

extension CityHistoricalInteractorImpl: CityHistorialInteractor {

    func getCityDetails() {
        presenter.displayCityDetails(cityDetails)
    }
}
