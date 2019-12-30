//
//  FavouriteCitiesPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresenter: SpinnerPresenter, AlertPresenter {
    func presentCities(allCities: [City], favourites: [City], cityName: String, filteringState: Bool)
}

extension FavouriteCitiesPresenter {
    func presentCities(allCities: [City], favourites: [City], cityName: String = "", filteringState: Bool = false) {
        presentCities(allCities: allCities, favourites: favourites, cityName: cityName, filteringState: filteringState)
    }
}

final class FavouriteCitiesPresenterImpl<T: FavouriteCitiesPresentable>: SharedPresenter<T> {}

extension FavouriteCitiesPresenterImpl: FavouriteCitiesPresenter {

    func presentCities(allCities: [City], favourites: [City], cityName: String, filteringState: Bool) {
        let mergedCities = mergeFavouriteCities(allCities: allCities, favourites: favourites)
        let searchedCities = mergedCities.filter { (cities: FavouriteCitiesListDisplayable) -> Bool in
            return cities.name.lowercased().contains(cityName.lowercased())
        }
        if filteringState {
            controller?.displayCities(searchedCities)
        } else {
            controller?.displayCities(mergedCities)
        }
    }
}

private extension FavouriteCitiesPresenterImpl {

    private func mergeFavouriteCities(allCities: [City], favourites: [City]) -> [FavouriteCitiesListDisplayable] {
        return allCities.map { FavouriteCitiesListDisplayable(city: $0, isFavourite: favourites.contains($0)) }
    }
}
