//
//  CityForecastCollectionViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 03/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

final class CityForecastCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var precipLabel: UILabel!

    func setup(with cityHourlyForecastListDisplayable: CityHourlyForecastListDisplayable) {
        hourLabel.text = cityHourlyForecastListDisplayable.hour
        tempLabel.text = cityHourlyForecastListDisplayable.temp
        precipLabel.text = cityHourlyForecastListDisplayable.precip
        weatherSymbol.image = UIImage(systemName: cityHourlyForecastListDisplayable.symbol.icon)
    }
}
