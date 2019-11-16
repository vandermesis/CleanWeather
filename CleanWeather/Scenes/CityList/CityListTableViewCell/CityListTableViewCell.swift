//
//  CityListTableViewCell.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 15/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

class CityListTableViewCell: UITableViewCell {
    
    //TODO: Make outlets private
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var cityTempLabel: UILabel!
    @IBOutlet private weak var cityWeatherSymbol: UIImageView!
    
    func setupWith(cityName: String, cityTemp: String, weatherSymbol: String) {
        self.cityNameLabel.text = cityName
        self.cityTempLabel.text = cityTemp
        self.cityWeatherSymbol.image = UIImage(systemName: weatherSymbol)
    }
    
}
