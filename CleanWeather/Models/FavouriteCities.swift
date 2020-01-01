//
//  FavouriteCities.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import Foundation

struct FavouriteCities {

    let allCities: [City]
    let favourites: [City]
    let filteringPhrase: String?
    let favouriteState: Bool?

    init (allCities: [City],
          favourites: [City],
          filteringPhrase: String? = nil,
          favouriteState: Bool? = nil) {
        self.allCities = allCities
        self.favourites = favourites
        self.filteringPhrase = filteringPhrase
        self.favouriteState = favouriteState
    }
}
