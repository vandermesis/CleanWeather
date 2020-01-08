//
//  CityForecastCellManager.swift
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

final class CityForecastCellManager: NSObject {

    private var items = [CellManagerItem]()
}

extension CityForecastCellManager: UITableViewDataSource {

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
            return buildHourlyForecastItemCell(item: item, tableView: tableView, indexPath: indexPath)
        case .dailyForecast:
            return buildDailyForecastItemCell(item: item, tableView: tableView, indexPath: indexPath)
        }
    }
}

extension CityForecastCellManager {

    func setup(with hourlyForecast: [CityHourlyForecastListDisplayable],
               _ dailyForecast: [CityDailyForecastListDisplayable]) {
        let hourlyForecastItem = CityForecastCellManagerHourlyForecastItem(hourlyForecast: hourlyForecast)
        items.append(hourlyForecastItem)
        let dailyForecastItem = CityForecastCellManagerDailyForecastItem(dailyForecast: dailyForecast)
        items.append(dailyForecastItem)
    }
}

private extension CityForecastCellManager {

    private func buildHourlyForecastItemCell(item: CellManagerItem,
                                             tableView: UITableView,
                                             indexPath: IndexPath) -> UITableViewCell {
        if let item = item as? CityForecastCellManagerHourlyForecastItem {
            let cell = tableView.dequeue(with: CityForecastCollectionViewTableViewCell.self, for: indexPath)
            cell.setup(with: item.hourlyForecast)
            return cell
        }
        return UITableViewCell()
    }

    private func buildDailyForecastItemCell(item: CellManagerItem,
                                            tableView: UITableView,
                                            indexPath: IndexPath) -> UITableViewCell {
        if let item = item as? CityForecastCellManagerDailyForecastItem {
            let cell = tableView.dequeue(with: CityForecastTableViewCell.self, for: indexPath)
            cell.setup(with: item.dailyForecast[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
