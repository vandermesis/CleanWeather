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
    func didSelectCity(id: String, citiesFilter: CitiesFilter?)
    func didPressSaveButton()
    func filterFavouriteCities(citiesFilter: CitiesFilter?)
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
            guard let self = self else { return }
            self.presenter.toggleSpinner(false)
            switch result {
            case .success(let city):
                self.allCities = city
                self.getFavouriteCities()
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }

    func didSelectCity(id: String, citiesFilter: CitiesFilter?) {
        guard let selectedCity = allCities.first(where: { $0.id == id }) else { return }
        if !favouriteCities.contains(selectedCity) {
            favouriteCities.append(selectedCity)
        } else {
            guard let cityIndex = favouriteCities.firstIndex(where: { $0.id == id }) else { return }
            favouriteCities.remove(at: cityIndex)
        }
        presenter.presentCities(allCities: allCities,
                                favourites: favouriteCities,
                                citiesFilter: citiesFilter)
    }

    func didPressSaveButton() {
        presenter.toggleSpinner(true)
        worker.saveFavourite(favouriteCities: favouriteCities) { result in
            self.presenter.toggleSpinner(false)
            switch result {
            case .success:
                self.router.navigateBackToCityList()
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }

    func filterFavouriteCities(citiesFilter: CitiesFilter?) {
        presenter.presentCities(allCities: allCities, favourites: favouriteCities, citiesFilter: citiesFilter)
    }
}

private extension FavouriteCitiesInteractorImpl {

    private func getFavouriteCities() {
        worker.fetchFavouriteCities { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favourites):
                self.favouriteCities = favourites
                self.presenter.presentCities(allCities: self.allCities, favourites: favourites)
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }
}
