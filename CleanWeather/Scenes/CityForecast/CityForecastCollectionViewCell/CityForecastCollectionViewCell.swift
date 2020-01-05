//
//  CityForecastCollectionViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

class CityForecastCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var precipLabel: UILabel!

    func setup(with cityForecastListDisplayable: CityHourlyForecastListDisplayable) {
        hourLabel.text = cityForecastListDisplayable.hour
        tempLabel.text = cityForecastListDisplayable.temp
        precipLabel.text = cityForecastListDisplayable.precip
        weatherSymbol.image = UIImage(systemName: cityForecastListDisplayable.symbol.icon)
    }
}
