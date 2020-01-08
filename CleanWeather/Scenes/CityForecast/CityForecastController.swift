//
//  CityForecastController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityForecastPresentable: SpinnerPresentable & AlertPresentable {
    func displayCityDetails(_ cityDetails: CityForecastDisplayable)
    func displayCityForecast(hourlyForecast: [CityHourlyForecastListDisplayable],
                             dailyForecast: [CityDailyForecastListDisplayable])
}

final class CityForecastController: SharedViewController {
    
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var forecastTableView: UITableView!

    private let interactor: CityForecastInteractor
    private let cellManager: CellManager

    init(interactor: CityForecastInteractor,
         cellManager: CellManager) {
        self.interactor = interactor
        self.cellManager = cellManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getCityDetails()
        interactor.getCityForecast()
        setupTableView()
        setupNavigationBar()
    }

    @IBAction private func historyButtonPressed(_ sender: UIBarButtonItem) {
        interactor.didPressHistoryButton()
    }
}

extension CityForecastController: CityForecastPresentable {
    
    func displayCityDetails(_ cityDetails: CityForecastDisplayable) {
        cityLabel.text = cityDetails.name
        tempLabel.text = cityDetails.temp
        weatherSymbol.image = UIImage(systemName: cityDetails.symbol.icon)
    }
    
    func displayCityForecast(hourlyForecast: [CityHourlyForecastListDisplayable],
                             dailyForecast: [CityDailyForecastListDisplayable]) {
        cellManager.setup(with: hourlyForecast, dailyForecast)
        forecastTableView.reloadData()
    }
}

private extension CityForecastController {

    private func setupTableView() {
        forecastTableView.register(cellType: CityForecastTableViewCell.self)
        forecastTableView.register(cellType: CityForecastCollectionViewTableViewCell.self)
        forecastTableView.dataSource = cellManager
        forecastTableView.separatorStyle = .none
    }

    private func setupNavigationBar() {
        title = R.string.localizable.cityForecastTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(historyButtonPressed(_:)))
    }
}
