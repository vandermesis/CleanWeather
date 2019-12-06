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
    let checked: Bool

    var favouriteIcon: UIImage? {
        return checked ? R.image.heartFilled() : R.image.heartOutline()
    }
}
