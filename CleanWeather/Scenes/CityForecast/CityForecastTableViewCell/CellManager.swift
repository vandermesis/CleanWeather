//
//  CellManager.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 07/01/2020.
//  Copyright © 2020 vandermesis. All rights reserved.
//

import UIKit

enum CellManagerItemType {

    case hourlyForecast
    case dailyForecast
}

protocol CellManagerItem {

    var type: CellManagerItemType { get }
    var rowCount: Int { get }
}

final class CellManager: NSObject {

    private var items = [CellManagerItem]()
}

extension CellManager: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .hourlyForecast:
            if let item = item as? CellManagerHourlyForecastItem {
                let cell = tableView.dequeue(with: CityForecastCollectionViewTableViewCell.self, for: indexPath)
                cell.setup(with: item.hourlyForecast)
                return cell
            }
        case .dailyForecast:
            if let item = item as? CellManagerDailyForecastItem {
                let cell = tableView.dequeue(with: CityForecastTableViewCell.self, for: indexPath)
                cell.setup(with: item.dailyForecast[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension CellManager {

    func setup(with hourlyForecast: [CityHourlyForecastListDisplayable],
               _ dailyForecast: [CityDailyForecastListDisplayable]) {
        let hourlyForecastItem = CellManagerHourlyForecastItem(hourlyForecast: hourlyForecast)
        items.append(hourlyForecastItem)
        let dailyForecastItem = CellManagerDailyForecastItem(dailyForecast: dailyForecast)
        items.append(dailyForecastItem)
    }
}
