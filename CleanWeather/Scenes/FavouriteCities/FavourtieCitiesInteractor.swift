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
    private var favouriteCities = [City]()

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
            self?.presenter.toggleSpinner(false)
            switch result {
            case .success(let city):
                guard let self = self else { return }
                self.allCities = city
                self.getFavouriteCities()
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }

    func didSelectCity(id: String, state: Bool) {
        let newState = !state
        guard let selectedCity = allCities.first(where: { $0.id == id }) else { return }
        if newState && !favouriteCities.contains(selectedCity) {
            favouriteCities.append(selectedCity)
        } else if !newState, let cityIndex = favouriteCities.firstIndex( where: { $0.id == id }) {
            favouriteCities.remove(at: cityIndex)
        }
        worker.saveFavourite(favouriteCities: favouriteCities) { [weak self] result in
            switch result {
            case .success:
                self?.getCities()
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
}

private extension FavouriteCitiesInteractorImpl {

    private func getFavouriteCities() {
        self.worker.fetchFavouriteCities { [weak self] result in
            switch result {
            case .success(let favourites):
                guard let self = self else { return }
                self.favouriteCities = favourites
                self.presenter.presentCities(allCities: self.allCities, favourites: favourites)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
}
