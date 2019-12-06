//
//  FavouriteCitiesTableViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 05/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class FavouriteCitiesTableViewCell: UITableViewCell {

    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var cityFavouriteImage: UIImageView!

    func setup(with favouriteCitiesListDisplayable: FavouriteCitiesListDisplayable) {
        cityNameLabel.text = favouriteCitiesListDisplayable.name
        cityFavouriteImage.image = UIImage(systemName: favouriteCitiesListDisplayable.favouriteIcon)
    }
}
