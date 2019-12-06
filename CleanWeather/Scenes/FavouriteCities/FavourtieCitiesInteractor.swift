//
//  FavourtieCitiesInteractor.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol FavouriteCitiesInteractor {
    func getCities()
    func didSelectCity(name: String)
}

final class FavouriteCitiesInteractorImpl {

    private var allCities = [City]()
    private var favouriteCities = [FavouriteCity]()

    private let presenter: FavouriteCitiesPresenter
    private let worker: FavouriteCitiesWorker
    private let router: FavouriteCitiesRouter

    init(presenter: FavouriteCitiesPresenter,
         worker: FavouriteCitiesWorker,
         router: FavouriteCitiesRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension FavouriteCitiesInteractorImpl: FavouriteCitiesInteractor {

    func getCities() {
        presenter.toggleSpinner(true)
        favouriteCities = worker.loadFavouriteCities()
        worker.fetchAllCities { [weak self] result in
            self?.presenter.toggleSpinner(false)
            switch result {
            case .success(let city):
                guard let self = self else { return }
                self.allCities = city
                self.presenter.presentCities(city: city, favourites: self.favouriteCities)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }

    func didSelectCity(name: String) {
        guard let selectedCity = allCities.first(where: { $0.name == name }) else { return }
        let favouriteCity = FavouriteCity(name: selectedCity.name, lat: selectedCity.latitude, lon: selectedCity.longitude, favourite: true)
        worker.toogleFavourite(for: favouriteCity)
        favouriteCities = worker.loadFavouriteCities()
        presenter.presentCities(city: allCities, favourites: favouriteCities)
    }
}
