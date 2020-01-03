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
    func displayCityForecast(_ cityForecast: [CityForecastListDisplayable])
}

final class CityForecastController: SharedViewController {
    
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var dailyForecastTableView: UITableView!
    @IBOutlet private weak var hourlyForecastCollectionView: UICollectionView!

    private let interactor: CityForecastInteractor
    
    private var cityForecastDataSource = [CityForecastListDisplayable]()
    
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
        setupCollectionView()
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
    
    func displayCityForecast(_ cityForecast: [CityForecastListDisplayable]) {
        cityForecastDataSource = cityForecast
        dailyForecastTableView.reloadData(with: .automatic)
        hourlyForecastCollectionView.reloadData()
    }
}

extension CityForecastController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityForecastDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityForecastTableViewCell.self, for: indexPath)
        cell.setup(with: cityForecastDataSource[indexPath.row])
        return cell
    }
}

extension CityForecastController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityForecastDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(with: CityForecastCollectionViewCell.self, for: indexPath)
        return cell
    }
}

private extension CityForecastController {

    private func setupTableView() {
        dailyForecastTableView.register(cellType: CityForecastTableViewCell.self)
        dailyForecastTableView.dataSource = self
    }

    private func setupCollectionView() {
        hourlyForecastCollectionView.register(cellType: CityForecastCollectionViewCell.self)
        hourlyForecastCollectionView.dataSource = self
    }

    private func setupNavigationBar() {
        title = R.string.localizable.cityForecastTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(historyButtonPressed(_:)))
    }
}
