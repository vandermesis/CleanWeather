//
//  CityListInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityListInteractor {
    func getCity()
    func didSelectCityCell(city: String)
}

final class CityListInteractorImpl {
    
    private var city = [CityWeather]()
    
    private let presenter: CityListPresenter
    private let worker: CityListWorker
    private let router: CityListRouter
    
    init(presenter: CityListPresenter,
         worker: CityListWorker,
         router: CityListRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension CityListInteractorImpl: CityListInteractor {
    
    func getCity() {
        presenter.showSpinner(true)
        worker.fetchCityWeather { [weak self] result in
            self?.presenter.showSpiner(false)
            switch result {
            case .success(let city):
                self?.city = city
                self?.presenter.displayCity(city: city)
            case .failure(let error):
                self?.presenter.displayError(error: error)
            }
        }
    }
    
    func didSelectCityCell(name: String) {
        router.navigateToCityDetails(city: name)
    }
}
