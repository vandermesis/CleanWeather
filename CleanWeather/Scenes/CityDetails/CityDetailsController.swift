//
//  CityDetailsController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityDetailsPresentable {
    func displayCityDetails(_ cityDetails: CityDetailsDisplayable)
}

final class CityDetailsController: SharedViewController {
    
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CityDetailsInteractor
    
    init(interactor: CityDetailsInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.updateUIWithPassedData()
    }
}

extension CityDetailsController: CityDetailsPresentable {
    
    func displayCityDetails(_ cityDetails: CityDetailsDisplayable) {
        cityLabel.text = cityDetails.name
        tempLabel.text = cityDetails.temp
        weatherSymbol.image = UIImage(systemName: cityDetails.symbol.icon)
    }
}