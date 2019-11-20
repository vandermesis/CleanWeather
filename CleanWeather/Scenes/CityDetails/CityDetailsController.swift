//
//  CityDetailsController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityDetailsPresentable {
    
}

final class CityDetailsController: SharedViewController {
    
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CityDetailsInteractor
    private let passedCityWeather: CityWeatherDisplayable
    
    init(interactor: CityDetailsInteractor, passedCityWeather: CityWeatherDisplayable) {
        self.interactor = interactor
        self.passedCityWeather = passedCityWeather
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIWithPassedWeatherData()
    }
    
    func updateUIWithPassedWeatherData() {
        tempLabel.text = passedCityWeather.temp
        cityLabel.text = passedCityWeather.name
        weatherSymbol.image = UIImage(systemName: passedCityWeather.symbol.icon)
    }
}

extension CityDetailsController: CityDetailsPresentable {
    
}
