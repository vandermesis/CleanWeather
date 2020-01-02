//
//  FavouriteCitiesPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresenter: SpinnerPresenter, AlertPresenter {
    func presentCities(favouriteCities: FavouriteCities)
}

final class FavouriteCitiesPresenterImpl<T: FavouriteCitiesPresentable>: SharedPresenter<T> {}

extension FavouriteCitiesPresenterImpl: FavouriteCitiesPresenter {

    func presentCities(favouriteCities: FavouriteCities) {
        let cities = filterCities(favouriteCities: favouriteCities)
        controller?.displayCities(cities)
    }
}

private extension FavouriteCitiesPresenterImpl {

    private func filterCities(favouriteCities: FavouriteCities) -> [FavouriteCitiesListDisplayable] {
        guard let filteringPhrase = favouriteCities.filteringPhrase else {
            return favouriteCities.mergeCitiesData
        }
        if !filteringPhrase.isEmpty {
            return searchCitiesForPhrase(favouriteCities: favouriteCities)
        } else {
            return searchCitiesForFavouriteState(favouriteCities: favouriteCities)
        }
    }

    private func searchCitiesForPhrase(favouriteCities: FavouriteCities) -> [FavouriteCitiesListDisplayable] {
        guard let filteringPhrase = favouriteCities.filteringPhrase else {
            return favouriteCities.mergeCitiesData
        }
        let favourites = searchCitiesForFavouriteState(favouriteCities: favouriteCities)
        return favourites.filter {
            $0.name.lowercased().contains(filteringPhrase.lowercased())
        }
    }

    private func searchCitiesForFavouriteState(favouriteCities: FavouriteCities) -> [FavouriteCitiesListDisplayable] {
        if favouriteCities.favouriteState == true {
            return favouriteCities.mergeCitiesData.filter { $0.isFavourite }
        } else {
            return favouriteCities.mergeCitiesData
        }
    }
}
