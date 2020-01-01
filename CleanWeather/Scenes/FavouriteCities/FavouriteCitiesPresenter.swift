//
//  FavouriteCitiesPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresenter: SpinnerPresenter, AlertPresenter {
    func presentCities(allCities: [City],
                       favourites: [City],
                       filteringPhrase: String?,
                       favouriteState: Bool?)
}

extension FavouriteCitiesPresenter {
    func presentCities(allCities: [City],
                       favourites: [City],
                       filteringPhrase: String? = nil,
                       favouriteState: Bool? = nil) {
        presentCities(allCities: allCities,
                      favourites: favourites,
                      filteringPhrase: filteringPhrase,
                      favouriteState: favouriteState)
    }
}

final class FavouriteCitiesPresenterImpl<T: FavouriteCitiesPresentable>: SharedPresenter<T> {}

extension FavouriteCitiesPresenterImpl: FavouriteCitiesPresenter {

    func presentCities(allCities: [City], favourites: [City], filteringPhrase: String?, favouriteState: Bool?) {
        let mergedCities = mergeFavouriteCities(allCities: allCities, favourites: favourites)
        guard let filteringPhrase = filteringPhrase else {
            controller?.displayCities(mergedCities)
            return
        }
        if !filteringPhrase.isEmpty {
            let filteredCities = mergedCities.filter {
                if favouriteState == true {
                    return $0.name.lowercased().contains(filteringPhrase.lowercased()) && $0.isFavourite
                } else {
                    return $0.name.lowercased().contains(filteringPhrase.lowercased())
                }
            }
            controller?.displayCities(filteredCities)
        } else {
            if favouriteState == true {
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
