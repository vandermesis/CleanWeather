//
//  FavouriteCitiesListDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

struct FavouriteCitiesListDisplayable {

    let id: String
    let name: String
    let isFavourite: Bool

    init(city: City, state: Bool) {
        id = city.id
        name = city.name
        self.isFavourite = state
    }

    var favouriteIcon: UIImage? {
        return isFavourite ? R.image.heartFilled() : R.image.heartOutline()
    }
}
