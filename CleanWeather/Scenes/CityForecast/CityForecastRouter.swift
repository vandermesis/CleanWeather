//
//  CityForecastRouter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 19/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityForecastRouter {
    func navigateToCityHistorical(cityWeather: CityWeather)
}

final class CityForecastRouterImpl {
    
    weak var controller: UIViewController?
}

extension CityForecastRouterImpl: CityForecastRouter {

    func navigateToCityHistorical(cityWeather: CityWeather) {
        let cityHistoricalController = CityHistoricalCreator().getController(with: cityWeather)
        controller?.navigationController?.pushViewController(cityHistoricalController, animated: true)
    }
}
