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
        let mergedCities = mergeFavouriteCities(allCities: favouriteCities.allCities,
                                                favourites: favouriteCities.favourites)
        guard let filteringPhrase = favouriteCities.filteringPhrase else {
            controller?.displayCities(mergedCities)
            return
        }
        if !filteringPhrase.isEmpty {
            let filteredCities = mergedCities.filter {
                if favouriteCities.favouriteState == true {
                    return $0.name.lowercased().contains(filteringPhrase.lowercased()) && $0.isFavourite
                } else {
                    return $0.name.lowercased().contains(filteringPhrase.lowercased())
                }
            }
            controller?.displayCities(filteredCities)
        } else {
            if favouriteCities.favouriteState == true {
                let filteredCities = mergedCities.filter { $0.isFavourite }
                controller?.displayCities(filteredCities)
            } else {
                controller?.displayCities(mergedCities)
            }
        }
    }
}

private extension FavouriteCitiesPresenterImpl {

    private func mergeFavouriteCities(allCities: [City], favourites: [City]) -> [FavouriteCitiesListDisplayable] {
        return allCities.map { FavouriteCitiesListDisplayable(city: $0, isFavourite: favourites.contains($0)) }
    }
}
