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
    func didSelectCity(id: String, state: Bool)
}

final class FavouriteCitiesInteractorImpl {

    private var allCities = [City]()

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
        worker.fetchAllCities { [weak self] result in
            switch result {
            case .success(let city):
                guard let self = self else { return }
                self.worker.fetchFavouriteCities { [weak self] result in
                    switch result {
                    case .success(let favourites):
                        self?.allCities = city
                        self?.presenter.presentCities(allCities: city, favourites: favourites)
                        self?.presenter.toggleSpinner(false)
                    case .failure(let error):
                        self?.presenter.presentError(error)
                        self?.presenter.toggleSpinner(false)
                    }
                }
            case .failure(let error):
                self?.presenter.presentError(error)
                self?.presenter.toggleSpinner(false)
            }
        }
    }

    func didSelectCity(id: String, state: Bool) {
        //FIXME: I can send How can I call presenter.presentCities without fetching favourites?
        guard let selectedCity = allCities.first(where: { $0.id == id }) else { return }
        worker.setFavouriteState(for: selectedCity, newState: state)
    }
}
