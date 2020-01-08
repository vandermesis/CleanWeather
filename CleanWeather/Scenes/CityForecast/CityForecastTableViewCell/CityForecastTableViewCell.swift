//
//  CityForecastTableViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 21/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

final class CityForecastTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var precipLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    
    func setup(with cityDailyForecastListDisplayable: CityDailyForecastListDisplayable) {
        dayLabel.text = cityDailyForecastListDisplayable.day
        maxTempLabel.text = cityDailyForecastListDisplayable.maxTemp
        minTempLabel.text = cityDailyForecastListDisplayable.minTemp
        precipLabel.text = cityDailyForecastListDisplayable.precip
        weatherSymbol.image = UIImage(systemName: cityDailyForecastListDisplayable.symbol.icon)
    }
}
