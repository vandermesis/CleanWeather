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

        //FIXME: Is it possible to do it with map/filter?
        for value in city {
            if favourites.contains(where: { $0.name == value.name }) {
                let favouriteCity = FavouriteCitiesListDisplayable(name: value.name, checked: true)
                displayable.append(favouriteCity)
            } else {
                let city = FavouriteCitiesListDisplayable(name: value.name, checked: false)
                displayable.append(city)
            }
        }
        controller?.displayCities(displayable)
        displayable = [FavouriteCitiesListDisplayable]()
    }
}
