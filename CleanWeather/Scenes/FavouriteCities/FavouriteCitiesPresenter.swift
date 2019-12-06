//
//  FavouriteCitiesPresenter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol FavouriteCitiesPresenter: SpinnerPresenter, AlertPresenter {
    func presentCities(city: [City], favourites: [FavouriteCity])
}

final class FavouriteCitiesPresenterImpl<T: FavouriteCitiesPresentable>: SharedPresenter<T> {

    private var displayable = [FavouriteCitiesListDisplayable]()
}

extension FavouriteCitiesPresenterImpl: FavouriteCitiesPresenter {

    func presentCities(city: [City], favourites: [FavouriteCity]) {
        if favourites.isEmpty {
            let city = city.map { FavouriteCitiesListDisplayable(name: $0.name , checked: false)}
            displayable = city
        }
        for value in city {
            for fav in favourites {
                if fav.name == value.name {
                    let favouriteCity = FavouriteCitiesListDisplayable(name: fav.name, checked: fav.favourite)
                    displayable.append(favouriteCity)
                    print("favorites")
                } else {
                    if !displayable.contains(where: { $0.name == value.name }) {
                        let city = FavouriteCitiesListDisplayable(name: value.name, checked: false)
                        displayable.append(city)
                        print("cities")
                    }
                }
            }
        }
        controller?.displayCities(displayable)
        displayable = [FavouriteCitiesListDisplayable]()
    }
}
