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
    
    func setupDetailsTableViewCell(with cityDetailsListDisplayable: CityForecastListDisplayable) {
        hourLabel.text = cityDetailsListDisplayable.hour
        tempLabel.text = cityDetailsListDisplayable.temp
        precipLabel.text = cityDetailsListDisplayable.precip
        weatherSymbol.image = UIImage(systemName: cityDetailsListDisplayable.symbol.icon)
    }
}
