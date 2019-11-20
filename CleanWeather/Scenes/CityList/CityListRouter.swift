//
//  CityListRouter.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 12/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit

protocol CityListRouter {
    func navigateToCityDetails(cityWeather: CityWeatherDisplayable)
}

final class CityListRouterImpl {
    
    weak var controller: UIViewController?
    
}

extension CityListRouterImpl: CityListRouter {
    
    func navigateToCityDetails(cityWeather: CityWeatherDisplayable) {
        let cityDetailsController = CityDetailsCreator().getController(with: cityWeather)
        controller?.navigationController?.pushViewController(cityDetailsController, animated: true)
    }
}
