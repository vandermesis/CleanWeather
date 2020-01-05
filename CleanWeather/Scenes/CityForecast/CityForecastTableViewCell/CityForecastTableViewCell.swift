//
//  CityForecastTableViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 21/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class CityForecastTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var precipLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    
    func setup(with cityForecastListDisplayable: CityDailyForecastListDisplayable) {
        dayLabel.text = cityForecastListDisplayable.day
        maxTempLabel.text = cityForecastListDisplayable.maxTemp
        minTempLabel.text = cityForecastListDisplayable.minTemp
        precipLabel.text = cityForecastListDisplayable.precip
        weatherSymbol.image = UIImage(systemName: cityForecastListDisplayable.symbol.icon)
    }
}
