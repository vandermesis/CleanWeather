//
//  CityListCellManagerMVVM.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 11/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

final class CityListCellManagerMVVM: NSObject {

    var citiesWeather = [CityWeather]()
    private var citiesWeatherDisplayable: [CityWeatherDisplayable] {
        return citiesWeather.map { CityWeatherDisplayable(object: $0)}
    }
}

extension CityListCellManagerMVVM {
    
    func buildCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: CityListTableViewCell.self, for: indexPath)
        cell.setup(with: citiesWeatherDisplayable[indexPath.row])
        return cell
    }

    func didSelectCityCell(indexPath: IndexPath) -> CityWeather {
        return citiesWeather[indexPath.row]
    }

    func setupCellManager(with citiesWeather: [CityWeather]) {
        self.citiesWeather = citiesWeather
    }
}
