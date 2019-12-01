//
//  CityHistoricalController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 01/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityHistoricalPresentable: SpinnerPresentable & AlertPresentable {
    func displayCityDetails(_ cityDetails: CityCurrentDisplayable)
    func displayCityHistorical(_ cityHistorical: CityHistoricalDisplayable)
}

final class CityHistoricalController: SharedViewController {

    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!

    private let interactor: CityHistorialInteractor

    init(interactor: CityHistorialInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("CityHistoricalController DEALLOCATED")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getCityDetails()
    }

    @IBAction private func datePickerChanged(_ sender: UIDatePicker) {
        let datePickerDate = sender.date
        interactor.getCityHistoricalWeather(date: datePickerDate)
    }

}

extension CityHistoricalController: CityHistoricalPresentable {

    func displayCityDetails(_ cityDetails: CityCurrentDisplayable) {
        cityLabel.text = cityDetails.name
        tempLabel.text = cityDetails.temp
        weatherSymbol.image = UIImage(systemName: cityDetails.symbol.icon)
    }

    func displayCityHistorical(_ cityHistorical: CityHistoricalDisplayable) {
        cityLabel.text = cityHistorical.name
        tempLabel.text = cityHistorical.temp
        weatherSymbol.image = UIImage(systemName: cityHistorical.symbol.icon)
    }
}
