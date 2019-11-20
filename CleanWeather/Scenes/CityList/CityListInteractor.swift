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
    func didSelectCityCell(with id: String)
}

final class CityListInteractorImpl {
    
    private var cityWeather = [CityWeather]()
    
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
        presenter.toggleSpinner(true)
        worker.fetchCityWeather { [weak self] result in
            self?.presenter.toggleSpinner(false)
            switch result {
            case .success(let city):
                self?.cityWeather = city
                self?.presenter.displayCitiesWeather(citiesWeather: city)
            case .failure(let error):
                self?.presenter.presentAlert(title: R.string.localizable.error(), message: error.userFriendlyMessage)
            }
        }
    }
    
    func didSelectCityCell(with id: String) {
        let filter = cityWeather.filter { $0.id == id }
        if let weather = filter.first {
            router.navigateToCityDetails(cityWeather: weather)
        }
    }
}
