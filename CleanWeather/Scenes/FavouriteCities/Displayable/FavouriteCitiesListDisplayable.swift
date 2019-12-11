//
//  FavouriteCitiesListDisplayable.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

struct FavouriteCitiesListDisplayable: Equatable {

    let id: String
    let name: String
    let isFavourite: Bool

    init(city: City, isFavourite: Bool) {
        id = city.id
        name = city.name
        self.isFavourite = isFavourite
    }

    lazy var favouriteIcon: UIImage? = {
        return isFavourite ? R.image.heartFilled() : R.image.heartOutline()
    }()
}
