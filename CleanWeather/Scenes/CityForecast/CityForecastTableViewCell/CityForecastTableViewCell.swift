//
//  CityForecastTableViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 21/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class CityForecastTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var precipLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    
    func setup(with cityForecastListDisplayable: CityForecastListDisplayable) {
        hourLabel.text = cityForecastListDisplayable.hour
        tempLabel.text = cityForecastListDisplayable.temp
        precipLabel.text = cityForecastListDisplayable.precip
        weatherSymbol.image = UIImage(systemName: cityForecastListDisplayable.symbol.icon)
    }
}
