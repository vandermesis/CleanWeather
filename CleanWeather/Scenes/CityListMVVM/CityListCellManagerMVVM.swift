//
//  CityListCellManagerMVVM.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 11/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

struct CityListCellManagerMVVM {

    func buildCell(tableView: UITableView,
                   indexPath: IndexPath,
                   citiesWeather: [CityWeather]) -> UITableViewCell {
        let citiesWeatherDisplayable = convertToCitiesWeatherDisplayable(citiesWeather: citiesWeather)
        let cell = tableView.dequeue(with: CityListTableViewCell.self, for: indexPath)
        cell.setup(with: citiesWeatherDisplayable[indexPath.row])
        return cell
    }
}

private extension CityListCellManagerMVVM {

    func convertToCitiesWeatherDisplayable(citiesWeather: [CityWeather]) -> [CityWeatherDisplayable] {
        return citiesWeather.map { CityWeatherDisplayable(object: $0)}
    }
}
