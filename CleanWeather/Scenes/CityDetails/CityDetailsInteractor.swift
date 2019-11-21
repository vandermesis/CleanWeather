//
//  CityDetailsInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityDetailsInteractor {
    func updateUIWithPassedData()
    func getDetailsList()
}

final class CityDetailsInteractorImpl {
    
    private let presenter: CityDetailsPresenter
    private let worker: CityDetailsWorker
    private let router: CityDetailsRouter
    private let passedCityWeather: CityWeather
    
    init(presenter: CityDetailsPresenter,
         worker: CityDetailsWorker,
         router: CityDetailsRouter,
         passedData: CityWeather) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
        self.passedCityWeather = passedData
    }
}

extension CityDetailsInteractorImpl: CityDetailsInteractor {
    
    func updateUIWithPassedData() {
        presenter.displayCityDetails(from: passedCityWeather)
    }
    
    func getDetailsList() {
        presenter.toggleSpinner(true)
        worker.fetchCityDetailsList { [weak self] result in
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
