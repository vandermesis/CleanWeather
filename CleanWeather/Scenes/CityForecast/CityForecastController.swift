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
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CityForecastInteractor
    
    private var cityForecastDataSource = [CityForecastListDisplayable]()
    
    init(interactor: CityForecastInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("CityForecastController DEALLOCATED")
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
    
    func displayCityForecast(_ cityForecast: [CityForecastListDisplayable]) {
        cityForecastDataSource = cityForecast
        tableView.reloadData()
    }
}

extension CityForecastController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityForecastDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityForecastTableViewCell.self, for: indexPath)
        cell.setupDetailsTableViewCell(with: cityForecastDataSource[indexPath.row])
        return cell
    }
}

private extension CityForecastController {

    private func setupTableView() {
        tableView.register(cellType: CityForecastTableViewCell.self)
        tableView.dataSource = self
        tableView.allowsSelection = false
    }

    private func setupNavigationBar() {
        title = R.string.localizable.now()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(historyButtonPressed(_:)))
    }
}
