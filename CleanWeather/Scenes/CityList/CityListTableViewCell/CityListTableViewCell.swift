//
//  CityListTableViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 15/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class CityListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    
    func setupCityListCell(with cityWeatherDisplayable: CityWeatherDisplayable) {
        nameLabel.text = cityWeatherDisplayable.name
        tempLabel.text = cityWeatherDisplayable.temp
        weatherSymbol.image = UIImage(systemName: cityWeatherDisplayable.symbol.icon)
    }
    
}
