//
//  FavouriteCitiesPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresenter: SpinnerPresenter, AlertPresenter {
    func presentCities(allCities: [City], favourites: [City], citiesFilter: CitiesFilter?)
}

extension FavouriteCitiesPresenter {
    func presentCities(allCities: [City], favourites: [City], citiesFilter: CitiesFilter? = nil) {
        presentCities(allCities: allCities, favourites: favourites, citiesFilter: citiesFilter)
    }
}

final class FavouriteCitiesPresenterImpl<T: FavouriteCitiesPresentable>: SharedPresenter<T> {}

extension FavouriteCitiesPresenterImpl: FavouriteCitiesPresenter {

    func presentCities(allCities: [City], favourites: [City], citiesFilter: CitiesFilter?) {
        let mergedCities = mergeCitiesData(allCities: allCities, favourites: favourites)
        guard let filter = citiesFilter else {
            controller?.displayCities(mergedCities)
            return
        }
        let filteredCities = filterCities(mergedCities: mergedCities, citiesFilter: filter)
        controller?.displayCities(filteredCities)
    }
}

private extension FavouriteCitiesPresenterImpl {

    private func mergeCitiesData(allCities: [City],
                                 favourites: [City]) -> [FavouriteCitiesListDisplayable] {
        return allCities.map { FavouriteCitiesListDisplayable(city: $0, isFavourite: favourites.contains($0))}
    }

    private func filterCities(mergedCities: [FavouriteCitiesListDisplayable],
                              citiesFilter: CitiesFilter) -> [FavouriteCitiesListDisplayable] {
        guard let filteringPhrase = citiesFilter.filteringPhrase else {
            return mergedCities
        }
        if !filteringPhrase.isEmpty {
            return searchCitiesForPhrase(mergedCities: mergedCities, citiesFilter: citiesFilter)
        } else {
            return searchCitiesForFavouriteState(mergedCities: mergedCities, citiesFilter: citiesFilter)
        }
    }

    private func searchCitiesForPhrase(mergedCities: [FavouriteCitiesListDisplayable],
                                       citiesFilter: CitiesFilter) -> [FavouriteCitiesListDisplayable] {
        guard let filteringPhrase = citiesFilter.filteringPhrase else {
            return mergedCities
        }
        let favourites = searchCitiesForFavouriteState(mergedCities: mergedCities, citiesFilter: citiesFilter)
        return favourites.filter {
            $0.name.lowercased().contains(filteringPhrase.lowercased())
        }
    }

    private func searchCitiesForFavouriteState(mergedCities: [FavouriteCitiesListDisplayable],
                                               citiesFilter: CitiesFilter) -> [FavouriteCitiesListDisplayable] {
        if citiesFilter.favouriteState == true {
            return mergedCities.filter { $0.isFavourite }
        } else {
            return mergedCities
        }
    }
}
