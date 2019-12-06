//
//  FavouriteCitiesPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresenter: SpinnerPresenter, AlertPresenter {
    func presentCities(city: [City], favourites: [City]?)
}

final class FavouriteCitiesPresenterImpl<T: FavouriteCitiesPresentable>: SharedPresenter<T> {}

extension FavouriteCitiesPresenterImpl: FavouriteCitiesPresenter {

    func presentCities(city: [City], favourites: [City]?) {

        guard let favouriteCities = favourites else { return }

        if favouriteCities.isEmpty {
            let city = city.map { FavouriteCitiesListDisplayable(id: $0.id, name: $0.name, checked: false)}
            controller?.displayCities(city)
        }

        //FIXME: How to preserve original order after merge both arrays?
        let extracated = city.filter { !favouriteCities.contains($0) }

        let extractedDisplayable = extracated.map { FavouriteCitiesListDisplayable(id: $0.id, name: $0.name, checked: false) }
        let favoritesDisplayable = favouriteCities.map { FavouriteCitiesListDisplayable(id: $0.id, name: $0.name, checked: true) }

        let merged = favoritesDisplayable + extractedDisplayable

        controller?.displayCities(merged)
    }
}
