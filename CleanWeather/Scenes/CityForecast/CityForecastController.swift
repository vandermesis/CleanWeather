//
//  CityForecastController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityForecastPresentable {
    func displayCityDetails(_ cityDetails: CityForecastDisplayable)
    func displayCityDetailsList(_ cityDetailsList: [CityForecastListDisplayable])
}

final class CityForecastController: SharedViewController {
    
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var weatherSymbol: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    
    private let interactor: CityForecastInteractor
    
    private var cityDetailsListDataSource = [CityForecastListDisplayable]()
    
    init(interactor: CityForecastInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.updateUIWithPassedData()
        interactor.getCityHourDetailsList()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(cellType: CityForecastTableViewCell.self)
        tableView.dataSource = self
    }
}

extension CityForecastController: CityForecastPresentable {
    
    func displayCityDetailsList(_ cityDetailsList: [CityForecastListDisplayable]) {
        cityDetailsListDataSource = cityDetailsList     
        tableView.reloadData()
    }

    func displayCityDetails(_ cityDetails: CityForecastDisplayable) {
        cityLabel.text = cityDetails.name
        tempLabel.text = cityDetails.temp
        weatherSymbol.image = UIImage(systemName: cityDetails.symbol.icon)
    }
}

extension CityForecastController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDetailsListDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityForecastTableViewCell.self, for: indexPath)
        cell.setupDetailsTableViewCell(with: cityDetailsListDataSource[indexPath.row])
        return cell
    }
}
