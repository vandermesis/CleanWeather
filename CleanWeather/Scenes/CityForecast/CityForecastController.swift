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
    @IBOutlet private weak var dailyForecastTableView: UITableView!

    private let interactor: CityForecastInteractor
    
    private var cityHourlyForecastDataSource = [CityHourlyForecastListDisplayable]()
    private var cityDailyForecastDataSource = [CityDailyForecastListDisplayable]()
    
    init(interactor: CityForecastInteractor) {
        self.interactor = interactor
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
        cityHourlyForecastDataSource = hourlyForecast
        cityDailyForecastDataSource = dailyForecast
        dailyForecastTableView.reloadData(with: .automatic)
    }
}

extension CityForecastController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDailyForecastDataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeue(with: CityForecastCollectionViewTableViewCell.self, for: indexPath)
            cell.setup(dataSource: cityHourlyForecastDataSource)
            return cell
        } else {
            let cell = tableView.dequeue(with: CityForecastTableViewCell.self, for: indexPath)
            cell.setup(with: cityDailyForecastDataSource[indexPath.row - 1])
            return cell
        }
    }
}

extension CityForecastController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        }
        return 40
    }
}

private extension CityForecastController {

    private func setupTableView() {
        dailyForecastTableView.register(cellType: CityForecastTableViewCell.self)
        dailyForecastTableView.register(cellType: CityForecastCollectionViewTableViewCell.self)
        dailyForecastTableView.dataSource = self
        dailyForecastTableView.delegate = self
        dailyForecastTableView.separatorStyle = .none
    }

    private func setupNavigationBar() {
        title = R.string.localizable.cityForecastTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(historyButtonPressed(_:)))
    }
}
