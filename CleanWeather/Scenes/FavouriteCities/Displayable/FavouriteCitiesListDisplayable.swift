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
    let state: Bool

    init(city: City, state: Bool) {
        id = city.id
        name = city.name
        self.state = state
    }

    var favouriteIcon: UIImage? {
        return state ? R.image.heartFilled() : R.image.heartOutline()
    }
}
