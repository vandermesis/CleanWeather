//
//  CityListInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol CityListInteractor {
    func getFavouriteCities()
    func didSelectCityCell(id: String)
    func didPressAddButton()
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

    func getFavouriteCities() {
        worker.fetchFavouriteCities { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favourites):
                self.getCitiesWeather(cities: favourites)
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }
    
    func didSelectCityCell(id: String) {
        guard let weather = cityWeather.first(where: { $0.id == id }) else { return }
        router.navigateToCityForecast(cityWeather: weather)
    }

    func didPressAddButton() {
        router.navigateToFavouriteCities()
    }
}

private extension CityListInteractorImpl {

    private func getCitiesWeather(cities: [City]) {
        if cities.isEmpty { return }
        presenter.toggleSpinner(true)
        worker.fetchCitiesWeather(cities: cities) { [weak self] result in
            guard let self = self else { return }
            self.presenter.toggleSpinner(false)
            switch result {
            case .success(let city):
                self.cityWeather = city
                self.presenter.presentCitiesWeather(citiesWeather: city)
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }
}
