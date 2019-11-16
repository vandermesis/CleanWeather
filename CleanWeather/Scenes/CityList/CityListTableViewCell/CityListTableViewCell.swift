//
//  CityListTableViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 15/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class CityListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var cityTempLabel: UILabel!
    @IBOutlet private weak var cityWeatherSymbol: UIImageView!
    
    func setupWith(cityWeatherDisplayable: CityWeatherDisplayable) {
        cityNameLabel.text = cityWeatherDisplayable.cityName
        cityTempLabel.text = cityWeatherDisplayable.cityTemp
        cityWeatherSymbol.image = UIImage(systemName: cityWeatherDisplayable.cityWeatherIcon.icon)
    }
    
}
