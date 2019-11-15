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
    
    let reuseID = "CityCell"
    
//    init(city: UILabel, temp: UILabel, symbol: UIImageView) {
//        super.init(style: .default, reuseIdentifier: reuseId)
//        self.cityNameLabel = city
//        self.cityTempLabel = temp
//        self.cityWeatherSymbol = symbol
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
