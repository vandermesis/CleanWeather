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
    func didSelectCity(id: String, userSearch: String, filteringState: Bool)
    func didPressSaveButton()
    func searchFavouriteCities(cityName: String, filteringState: Bool)
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

    func didSelectCity(id: String, userSearch: String, filteringState: Bool) {
        guard let selectedCity = allCities.first(where: { $0.id == id }) else { return }
        if !favouriteCities.contains(selectedCity) {
            favouriteCities.append(selectedCity)
        } else {
            guard let cityIndex = favouriteCities.firstIndex(where: { $0.id == id }) else { return }
            favouriteCities.remove(at: cityIndex)
        }
        presenter.presentCities(allCities: allCities, favourites: favouriteCities, cityName: userSearch, filteringState: filteringState)
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

    func searchFavouriteCities(cityName: String, filteringState: Bool) {
        presenter.presentCities(allCities: allCities, favourites: favouriteCities, cityName: cityName, filteringState: filteringState)
    }
}

private extension FavouriteCitiesInteractorImpl {

    private func getFavouriteCities() {
        worker.fetchFavouriteCities { [weak self] result in
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
