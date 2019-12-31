//
//  FavouriteCitiesPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresenter: SpinnerPresenter, AlertPresenter {
    func presentCities(allCities: [City], favourites: [City], cityName: String, filteringState: Bool, favouriteState: Bool)
}

extension FavouriteCitiesPresenter {
    func presentCities(allCities: [City], favourites: [City], cityName: String = "", filteringState: Bool = false, favouriteState: Bool = false) {
        presentCities(allCities: allCities, favourites: favourites, cityName: cityName, filteringState: filteringState, favouriteState: favouriteState)
    }
}

final class FavouriteCitiesPresenterImpl<T: FavouriteCitiesPresentable>: SharedPresenter<T> {}

extension FavouriteCitiesPresenterImpl: FavouriteCitiesPresenter {

    func presentCities(allCities: [City], favourites: [City], cityName: String, filteringState: Bool, favouriteState: Bool) {
        let mergedCities = mergeFavouriteCities(allCities: allCities, favourites: favourites)
        if filteringState {
            let searchedCities = mergedCities.filter { (city: FavouriteCitiesListDisplayable) -> Bool in
                let doesFavouriteMatch = favouriteState == false || city.isFavourite == favouriteState
                if cityName.isEmpty {
                    return doesFavouriteMatch
                } else {
                    return doesFavouriteMatch && city.name.lowercased().contains(cityName.lowercased())
                }
            }
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
