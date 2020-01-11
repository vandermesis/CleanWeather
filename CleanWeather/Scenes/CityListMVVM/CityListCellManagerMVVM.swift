//
//  CityListCellManagerMVVM.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 11/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

protocol CityListCellManagerMVVMDelegate: class {

    func didSelectCityCell(city: CityWeather)
}

final class CityListCellManagerMVVM: NSObject {

    private var citiesWeather = [CityWeather]()
    private var citiesWeatherDisplayable: [CityWeatherDisplayable] {
        return citiesWeather.map { CityWeatherDisplayable(object: $0)}
    }

    weak var delegate: CityListCellManagerMVVMDelegate?
}

extension CityListCellManagerMVVM: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeatherDisplayable.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityListTableViewCell.self, for: indexPath)
        cell.setup(with: citiesWeatherDisplayable[indexPath.row])
        return cell
    }
}

extension CityListCellManagerMVVM: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = citiesWeather[indexPath.row]
        delegate?.didSelectCityCell(city: city)
    }

}

extension CityListCellManagerMVVM {

    func setup(with citiesWeather: [CityWeather]) {
        self.citiesWeather = citiesWeather
    }
}
